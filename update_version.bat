@echo off
REM Update ETL App from Git
REM This script pulls the latest changes from the upstream repository

echo ========================================
echo ETL App - Git Update Script
echo ========================================
echo.

REM Navigate to the ETL-App directory
cd /d "%~dp0"

echo Current directory: %cd%
echo.

REM Fetch latest changes from upstream
echo Fetching latest changes from upstream...
git fetch upstream
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Failed to fetch from upstream
    echo Make sure you have added the upstream remote:
    echo   git remote add upstream [UPSTREAM_URL]
    pause
    exit /b 1
)

echo.
echo Checking out main branch...
git checkout main
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Failed to checkout main branch
    pause
    exit /b 1
)

echo.
echo Rebasing with upstream/main...
git rebase upstream/main
if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Rebase failed
    echo You may need to resolve conflicts manually
    pause
    exit /b 1
)

echo.
echo ========================================
echo Update completed successfully!
echo ========================================
echo.

pause
