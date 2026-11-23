
$ErrorActionPreference = 'Stop'

$gra = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'gra.json') -Raw | ConvertFrom-Json

$dane = Invoke-RestMethod -Uri "https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=$($gra.appid)&count=1&maxlength=300&feeds=steam_community_announcements" -UseBasicParsing -TimeoutSec 20

$news = $dane.appnews.newsitems[0]

Write-Output "$($gra.nazwa) | $($news.title) | $($news.url)"
