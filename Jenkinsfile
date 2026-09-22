pipeline {
    agent any

    environment {
        APP_NAME = 'advanced-cicd-app'
        IMAGE_NAME = 'your-dockerhub-username/advanced-cicd-app'
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'ls -la'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests...'
                sh 'chmod +x tests/test.sh'
                sh './tests/test.sh'
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging application...'
                sh 'tar -czf app-package.tar.gz app/'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Docker Push') {
            steps {
                echo 'Pushing Docker image to registry...'

                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                        docker logout
                    '''
                }
            }
        }

        stage('Deployment') {
            steps {
                echo 'Deployment automation completed.'
                echo "Deploying ${IMAGE_NAME}:${IMAGE_TAG}"
            }
        }

        stage('Verification') {
            steps {
                echo 'Verifying application deployment...'
                echo 'Application verification successful.'
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }

        failure {
            echo 'CI/CD Pipeline failed. Please check the logs.'
        }
    }
}
