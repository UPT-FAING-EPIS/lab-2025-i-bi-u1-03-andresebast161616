$server = $env:AZURE_SQL_SERVER
$username = $env:AZURE_SQL_ADMIN
$password = $env:AZURE_SQL_PASSWORD
$database = "azurelab3powerbi-db"

$sqlCommand = @"
CREATE TABLE TestTable (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50)
);
"@

# Instalamos el módulo SqlServer si no está instalado
if (-not (Get-Module -ListAvailable -Name SqlServer)) {
    Install-Module -Name SqlServer -Force -Scope CurrentUser
}

Invoke-Sqlcmd -ServerInstance $server `
    -Database $database `
    -Username $username `
    -Password $password `
    -Query $sqlCommand `
    -Encrypt Connection `
    -TrustServerCertificate
