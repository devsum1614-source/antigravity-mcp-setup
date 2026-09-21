Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Antigravity GitHub MCP Setup           " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "If you don't have a token yet, generate one at:" -ForegroundColor Yellow
Write-Host "https://github.com/settings/tokens/new?scopes=repo,read:org,user&description=Antigravity+MCP" -ForegroundColor Green
Write-Host ""

$secToken = Read-Host "Paste your GitHub Token (input hidden)" -AsSecureString
if (-not $secToken) {
    Write-Warning "No token entered. Setup aborted."
    exit 1
}

$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secToken)
$plainToken = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

$cfgPath = "$HOME\.gemini\config\mcp_config.json"
$cfg = Get-Content $cfgPath -Raw | ConvertFrom-Json
$cfg.mcpServers.github.env.GITHUB_PERSONAL_ACCESS_TOKEN = $plainToken
$cfg | ConvertTo-Json -Depth 5 | Set-Content $cfgPath -Encoding UTF8

[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)

Write-Host ""
Write-Host "[SUCCESS] GitHub MCP Server configured in Antigravity!" -ForegroundColor Green
Write-Host "You can now use GitHub tools inside Antigravity CLI and IDE." -ForegroundColor White
Write-Host "=========================================" -ForegroundColor Cyan