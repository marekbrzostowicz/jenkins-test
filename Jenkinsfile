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
                    $xmlName = "test-report.xml"
                    $xmlPath = "$env:WORKSPACE\\$xmlName"
                    
                    if (Test-Path $xmlPath) { Remove-Item $xmlPath -Force }

                    $conf = New-PesterConfiguration
                    $conf.Run.Path = ".\\Math.Tests.ps1"
                    $conf.TestResult.Enabled = $true
                    
                    # --- TU JEST KLUCZOWA ZMIANA ---
                    # Zmieniamy format na JUnitXml (jezyk Jenkinsa)
                    $conf.TestResult.OutputFormat = "JUnitXml"
                    # -------------------------------
                    
                    $conf.TestResult.OutputPath = $xmlPath
                    
                    Invoke-Pester -Configuration $conf

                    # Kodowanie UTF-8 (zostawiamy, bo to pomaga)
                    if (Test-Path $xmlPath) {
                        $content = Get-Content $xmlPath
                        Set-Content -Path $xmlPath -Value $content -Encoding UTF8
                        Write-Host "--- ZROBIONE: Plik gotowy ($xmlPath) ---" -ForegroundColor Green
                    }
                '''
            }
        }
    }

    post {
        always {

            junit 'test-report.xml'
        }
    }
}