pipeline {
    agent any

    tools {
        maven 'MAVEN'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/nymishagit/java-ci-cd-project.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t java-ci-cd:latest .'
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker rm -f java-app || true
                docker run -d -p 8080:8080 --name java-app java-ci-cd:latest
                '''
            }
        }
    }
}
