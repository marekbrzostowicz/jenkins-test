pipeline {
    agent any 

    stages {
        stage('pobranie kodu'){
            steps {
                powershell 'Get-ChildItems'
            }
        }

        stage ('Testy'){
            steps {
                powershell ''' Invoke-Pester -Path .\\Math.Tests.ps1 -OutputFile "wyniki,xml" -OutputFormat NUnitXml '''
            }
        }
    }
    post {
        always {
            junit 'wyniki.xml'
        }
    }
}