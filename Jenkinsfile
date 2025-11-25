pipeline {
    agent any

    stages {
        stage('Pobranie Kodu') {
            steps {
                powershell 'ls'
            }
        }

        stage('Testy (Pester)') {
            steps {
                powershell '''
                    # 1. Nowa nazwa pliku (czysta karta)
                    $xmlName = "test-report.xml"
                    $xmlPath = "$env:WORKSPACE\\$xmlName"
                    
                    # Sprzątanie
                    if (Test-Path $xmlPath) { Remove-Item $xmlPath -Force }

                    # 2. Konfiguracja Pestera
                    $conf = New-PesterConfiguration
                    $conf.Run.Path = ".\\Math.Tests.ps1"
                    $conf.TestResult.Enabled = $true
                    $conf.TestResult.OutputFormat = "NUnitXml"
                    $conf.TestResult.OutputPath = $xmlPath
                    
                    # 3. Odpalamy testy
                    Invoke-Pester -Configuration $conf

                    # 4. NAPRAWA KODOWANIA (To jest klucz do sukcesu!)
                    if (Test-Path $xmlPath) {
                        # Odczytaj treść i zapisz wymuszając UTF8
                        $content = Get-Content $xmlPath
                        Set-Content -Path $xmlPath -Value $content -Encoding UTF8
                        
                        Write-Host "--- DEBUG: Przekonwertowano na UTF-8 ---" -ForegroundColor Green
                        
                        # Pokaz mi ten plik w logach!
                        Write-Host "--- ZAWARTOSC PLIKU: ---" -ForegroundColor Yellow
                        Get-Content $xmlPath -TotalCount 5
                    } else {
                        Write-Error "Plik nie powstal!"
                        exit 1
                    }
                '''
            }
        }
    }

    post {
        always {
            # Gwiazdka znajdzie kazdy xml, nawet jak pomylisz nazwy
            junit '*.xml'
        }
    }
}