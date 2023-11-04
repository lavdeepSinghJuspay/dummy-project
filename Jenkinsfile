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
        stage('Install Python') {
            steps {
                sh 'bash install_python.sh'
            }
        }
        stage('Build') {
            steps {
                // Build the project using the Makefile
                sh 'make start-server'
            }
        }
    }
    stage('Make HTTP Request') {
            steps {
                script {
                    // Use the requests library to make an HTTP GET request to your Flask service
                    def response = sh(script: 'python make_request.py', returnStatus: true)
                    
                    if (response == 0) {
                        currentBuild.result = 'SUCCESS'
                    } else {
                        currentBuild.result = 'FAILURE'
                    }
                }
            }
        }
    post {
        always {
            // Stop the server after the build
            sh 'pkill -f "python3 app.py"'
        }
    }
}
