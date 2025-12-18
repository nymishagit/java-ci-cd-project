
pipeline {
  agent any

  tools {
    maven 'MAVEN'
  }

  stages {
    stage('Checkout') {
      steps {
        // This uses the job's SCM config (Pipeline script from SCM)
        checkout scm
      }
    }

    stage('Maven Build') {
      steps {
        sh 'mvn --version'
        sh 'mvn clean package'
      }
      post {
        always {
          archiveArtifacts artifacts: 'target/*.war', fingerprint: true
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker --version || true'
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
