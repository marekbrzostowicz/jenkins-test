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
  
                    $xmlPath = "$env:WORKSPACE\\wyniki.xml"
                    
                    Write-Host "--- DEBUG: Sciezka do XML: $xmlPath ---" -ForegroundColor Cyan


                    if (Test-Path $xmlPath) {
                        Remove-Item $xmlPath -Force
                        Write-Host "--- DEBUG: Usunieto stary plik XML ---" -ForegroundColor Yellow
                    }


                    $conf = New-PesterConfiguration
                    $conf.Run.Path = ".\\Math.Tests.ps1"
                    $conf.TestResult.Enabled = $true
                    $conf.TestResult.OutputFormat = "NUnitXml"
                    $conf.TestResult.OutputPath = $xmlPath
                    

                    Invoke-Pester -Configuration $conf

                    if (Test-Path $xmlPath) {
                        Write-Host "--- DEBUG: SUKCES! Plik istnieje. Jego rozmiar:"
                        (Get-Item $xmlPath).Length
                    } else {
                        Write-Host "--- DEBUG: Plik nie powstal" -ForegroundColor Red
                        exit 1
                    }
                '''
            }
        }
    }

    post {
        always {
            // Teraz mamy pewnosc, ze czytamy swiezy plik
            junit 'wyniki.xml'
        }
    }
}