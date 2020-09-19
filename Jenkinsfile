pipeline {
    agent any

    stages {
        stage('Cleanup'){
            steps {
                sh '''
                docker rmi $(docker images -f 'dangling=true' -q) || true
                docker rmi $(docker images | sed 1,2d | awk '{print $3}') || true
                '''
            }
        }
        stage('Build Image Docker') {
            steps {
                sh 'docker build -t indragiri21/pesbuk-bigpro:$BUILD_NUMBER .'
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
