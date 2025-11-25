pipeline {
    agent any 

    stages {
        stage('pobranie kodu'){
            steps {

                bat 'echo Udalo sie pobrac kod z GitHuba!'
            }
        }

        stage ('Testy'){
            steps {

                bat 'dir'
            }
        }
    }
    post {
        always {
            junit 'wyniki.xml'
        }
    }
}
