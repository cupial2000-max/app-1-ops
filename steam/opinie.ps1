
$ErrorActionPreference = 'Stop'

$gra = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'gra.json') -Raw | ConvertFrom-Json

$parametry = @{
    appid = $gra.appid
    languages = @('all')
    num_per_page = 1
    purchase_type = 1
} | ConvertTo-Json -Compress

$dane = Invoke-RestMethod -Uri 'https://api.steampowered.com/IUserReviewsService/GetAppReviews/v1/' -Body @{ input_json = $parametry } -UseBasicParsing -TimeoutSec 20

Write-Output "$($gra.nazwa) | Ocena: $($dane.response.query_summary.review_score_desc) | Liczba recenzji: $($dane.response.query_summary.total_reviews)"
