pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockercrd'
        DOCKERHUB_REPO = 'neelpatel5270/day14_project'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/neel52700/Day14_Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build(DOCKERHUB_REPO)
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        docker.image(DOCKERHUB_REPO).push('latest')
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    echo "Deploy Stage"
                    sh 'javac Sample.java'
                    sh 'java Sample'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
            echo "Pipeline finished"
        }
    }
}
