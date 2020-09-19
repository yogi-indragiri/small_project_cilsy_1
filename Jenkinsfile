pipeline {
    agent any

    stages {
        stage('Build Image Docker') {
            steps {
                sh 'docker build -t indragiri21/pesbuk-bigpro:0.1 .'
            }
        }
        stage('Push Image Docker') {
            steps {
                echo 'Push Image'
            }
        }
        stage('Deploy Kubernetes') {
            steps {
                echo 'Deploy Kubernetes'
            }
        }
    }
}
