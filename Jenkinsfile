pipeline {
    agent any

    stages {
        stage('Build Image Docker') {
            steps {
                sh 'docker build -t indragiri21/pesbuk-bigpro:$BUILD_NUMBER .'
            }
        }
        stage('Push Image Docker') {
            steps {
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                    sh "docker login -u indragiri21 -p ${dockerHubPwd}"
                }
                sh 'docker push indragiri21/pesbuk-bigpro:$BUILD_NUMBER'
            }
        }
        stage('Deploy Kubernetes') {
            steps {
                sh 'sed -i "s/buildNumber/$BUILD_NUMBER/g" deployment.yaml'
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}
