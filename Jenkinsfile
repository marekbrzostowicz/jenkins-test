pipeline {
    agent any
    stages {
        stage('Pobranie z Gita') {
            steps {
                // To sie wyswietli, jak Jenkins pobierze kod
                bat 'echo Udalo sie pobrac kod z GitHuba!'
            }
        }
        stage('Sprawdzenie plikow') {
            steps {
                // Zobaczymy, czy Jenkins widzi Jenkinsfile
                bat 'dir'
            }
        }
    }
}