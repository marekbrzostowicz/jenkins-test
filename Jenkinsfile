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
                    $config = New-PesterConfiguration

                    $config.Run.Path = ".\\Math.Tests.ps1"

                    $config.TestResult.Enabled = $true
                    $config.TestResult.OutputFormat = "NUnitXml"
                    $config.TestResult.OutputPath = "wyniki.xml"

                    Invoke-Pester -Configuration $config

                '''
            }
        }
    }

    post {
        always {

            junit 'wyniki.xml'
            
        }
    }
}