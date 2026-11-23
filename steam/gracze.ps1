
$ErrorActionPreference = 'Stop'

$gra = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'gra.json') -Raw | ConvertFrom-Json

$dane = Invoke-RestMethod -Uri "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=$($gra.appid)" -UseBasicParsing -TimeoutSec 20

Write-Output "$($gra.nazwa) | Liczba graczy online: $($dane.response.player_count)"
