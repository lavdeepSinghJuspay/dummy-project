pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the source code from Git
                    checkout scm
                }
            }
        }
        stage('Build') {
            steps {
                // Build the project using the Makefile
                sh 'make start-server'
            }
        }
    }
    post {
        always {
            // Stop the server after the build
            sh 'pkill -f "python app.py"'
        }
    }
}
