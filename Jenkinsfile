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
                    Invoke-Pester -Path ".\\Math.Tests.ps1" -OutputFile "wyniki.xml" -OutputFormat NUnitXml
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