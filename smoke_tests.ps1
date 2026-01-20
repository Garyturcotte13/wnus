$ErrorActionPreference = 'Stop'

$tests = @(
    'yes -n 3 hi',
    'seq 1 3',
    'seq -s , 1 2 5',
    'jot -b x 3',
    'jot 3 1 2',
    'factor 60 97',
    'logname',
    'users',
    'mesg',
    'mesg n',
    'mesg y',
    'write testuser hello world',
    'wall broadcast test',
    'pathchk "C:/tmp" valid_name "bad^|name"',
    'true',
    'false',
    'tty',
    'script -c "echo script run" script_test.txt',
    'logger -t smoke logging message'
)

# du-specific tests with a temp file
$tmpDu = 'tmp_du.txt'
Set-Content -Path $tmpDu -Value 'data'
$tests += @(
    "du -b $tmpDu",
    'du -B 1K -d 0 .'
)

# Virtual root tests
$tests += @(
    'cd / && pwd',
    'cd / && ls',
    'cd / && cd C && pwd',
    'cd / && cd /C/Windows && pwd'
)

function Run-Test {
    param(
        [string]$Cmd,
        [int]$Index
    )

    $out = Join-Path -Path $PSScriptRoot -ChildPath ("_test_{0}.txt" -f $Index)
    $err = Join-Path -Path $PSScriptRoot -ChildPath ("_test_{0}.err" -f $Index)
    Write-Host "=== $Cmd" -ForegroundColor Cyan
    Start-Process -FilePath (Join-Path $PSScriptRoot 'wnus.exe') -ArgumentList '-c', $Cmd -NoNewWindow -Wait -RedirectStandardOutput $out -RedirectStandardError $err
    Get-Content $out
    if (Test-Path $err) { Get-Content $err }
    Remove-Item $out -Force
    Remove-Item $err -Force -ErrorAction SilentlyContinue
}

$i = 0
foreach ($t in $tests) {
    $i++
    Run-Test -Cmd $t -Index $i
}

Remove-Item $tmpDu -Force -ErrorAction SilentlyContinue
Remove-Item (Join-Path $PSScriptRoot 'script_test.txt') -Force -ErrorAction SilentlyContinue
