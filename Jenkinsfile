pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockercrd') // Add your DockerHub credentials ID in Jenkins
        DOCKERHUB_REPO = 'neelpatel5270/day14_project' // Your DockerHub repository
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/neel52700/Day14_Project.git' // Your GitHub repository URL
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build(DOCKERHUB_REPO)
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('', 'DOCKERHUB_CREDENTIALS') {
                        docker.image("$DOCKERHUB_REPO:latest").push()
                    }
                }
            }
        }
        stage('Deploy Container') {
            steps {
                script {
                    sh 'javac Sample.java' // Adjust port mapping as necessary
                    sh 'java Sample'
                }
            }
        }
    }
}
