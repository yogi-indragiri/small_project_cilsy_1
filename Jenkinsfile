env.DOCKER_REGISTRY = 'indragiri21'
env.DOCKER_IMAGE_NAME_DEV = 'pesbuk-bigpro-dev'
env.DOCKER_IMAGE_NAME = 'pesbuk-bigpro'

pipeline {
    agent any

    stages {
        stage('Build Image Docker Dev') {
            when {
                branch 'development'
            }
            steps {
                sh 'docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME_DEV:$BUILD_NUMBER .'
            }
        }
        stage('Build Image Docker Prod') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:$BUILD_NUMBER .'
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
        stage('Deploy Kubernetes Dev') {
            when {
                branch 'development'
            }
            steps {
                sh '''
                sed -i "s/buildNumber/$BUILD_NUMBER/g" dev-deployment.yaml
                kubectl apply -f dev-deployment.yaml
                '''
            }
        }
        stage('Deploy Kubernetes Prod') {
            when {
                branch 'master'
            }
            steps {
                sh '''
                sed -i "s/buildNumber/$BUILD_NUMBER/g" deployment.yaml
                kubectl apply -f deployment.yaml
                '''
            }
        }
        stage('Remove Docker Image Dev') {
            when {
                branch 'development'
            }
            steps {
                sh "docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME_DEV:${BUILD_NUMBER}"   
            }
        }
        stage('Remove Docker Image') {
            when {
                branch 'master'
            }
            steps {
                sh "docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE_NAME:${BUILD_NUMBER}"   
            }
        }
    }
}
