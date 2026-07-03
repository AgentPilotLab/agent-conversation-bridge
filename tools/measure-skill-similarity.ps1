param(
  [string]$CandidatePath = ".\skills\agent-conversation-bridge\SKILL.md",
  [string]$ReferenceUrl = "https://raw.githubusercontent.com/mattpocock/skills/main/skills/productivity/handoff/SKILL.md",
  [double]$MaxLineJaccard = 10.0,
  [double]$MaxTokenJaccard = 25.0,
  [double]$MaxPhraseJaccard = 5.0
)

$ErrorActionPreference = "Stop"

function Normalize-Text([string]$Text) {
  return (($Text -replace "`r`n", "`n") -replace "`r", "`n").Trim()
}

function Get-Tokens([string]$Text) {
  $matches = [regex]::Matches($Text.ToLowerInvariant(), "[a-z0-9_./:-]+")
  return @($matches | ForEach-Object { $_.Value })
}

function Get-Ngrams([string[]]$Tokens, [int]$N) {
  $grams = New-Object System.Collections.Generic.List[string]
  if ($Tokens.Count -lt $N) { return @() }
  for ($i = 0; $i -le $Tokens.Count - $N; $i++) {
    $grams.Add(($Tokens[$i..($i + $N - 1)] -join " "))
  }
  return @($grams)
}

function Get-JaccardPercent([string[]]$Left, [string[]]$Right) {
  $a = [System.Collections.Generic.HashSet[string]]::new([string[]]$Left)
  $b = [System.Collections.Generic.HashSet[string]]::new([string[]]$Right)
  $intersection = [System.Collections.Generic.HashSet[string]]::new($a)
  $intersection.IntersectWith($b)
  $union = [System.Collections.Generic.HashSet[string]]::new($a)
  $union.UnionWith($b)
  if ($union.Count -eq 0) { return 0.0 }
  return [math]::Round(100.0 * $intersection.Count / $union.Count, 2)
}

if (-not (Test-Path -LiteralPath $CandidatePath)) {
  throw "Candidate file not found: $CandidatePath"
}

$candidate = Normalize-Text (Get-Content -LiteralPath $CandidatePath -Raw)
$reference = Normalize-Text ((Invoke-WebRequest -Uri $ReferenceUrl -UseBasicParsing).Content)

$candidateLines = @($candidate -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" })
$referenceLines = @($reference -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" })
$candidateTokens = @(Get-Tokens $candidate)
$referenceTokens = @(Get-Tokens $reference)
$candidatePhrases = @(Get-Ngrams $candidateTokens 5)
$referencePhrases = @(Get-Ngrams $referenceTokens 5)

$lineJaccard = Get-JaccardPercent $candidateLines $referenceLines
$tokenJaccard = Get-JaccardPercent $candidateTokens $referenceTokens
$phraseJaccard = Get-JaccardPercent $candidatePhrases $referencePhrases

$candidateLineSet = [System.Collections.Generic.HashSet[string]]::new([string[]]$candidateLines)
$referenceLineSet = [System.Collections.Generic.HashSet[string]]::new([string[]]$referenceLines)
$sharedLines = [System.Collections.Generic.HashSet[string]]::new($candidateLineSet)
$sharedLines.IntersectWith($referenceLineSet)
$nontrivialShared = @($sharedLines | Where-Object { $_.Length -gt 12 })

$result = [ordered]@{
  candidate = (Resolve-Path -LiteralPath $CandidatePath).Path
  reference = $ReferenceUrl
  candidate_lines = $candidateLines.Count
  reference_lines = $referenceLines.Count
  line_jaccard_percent = $lineJaccard
  token_jaccard_percent = $tokenJaccard
  fivegram_jaccard_percent = $phraseJaccard
  nontrivial_shared_lines = $nontrivialShared
  thresholds = [ordered]@{
    max_line_jaccard_percent = $MaxLineJaccard
    max_token_jaccard_percent = $MaxTokenJaccard
    max_fivegram_jaccard_percent = $MaxPhraseJaccard
  }
}

$result | ConvertTo-Json -Depth 5

if ($lineJaccard -gt $MaxLineJaccard -or $tokenJaccard -gt $MaxTokenJaccard -or $phraseJaccard -gt $MaxPhraseJaccard) {
  throw "Similarity gate failed."
}

Write-Output "Similarity gate passed."
