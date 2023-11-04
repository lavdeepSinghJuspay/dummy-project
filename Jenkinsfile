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
        stage('Start Flask Service') {
            steps {
                script {
                    // Start your Flask service in the background
                    sh 'python3 app.py &'
                }
            }
        }
        stage('Wait for Service to Start') {
            steps {
                script {
                    // Wait for some time to ensure that the service has started
                    sleep 10
                }
            }
        }
        stage('Make HTTP Request') {
            steps {
                script {
                    // Use the requests library to make an HTTP GET request to your Flask service
                    def response = sh(script: 'python3 make_request.py', returnStatus: true)
                    
                    if (response == 0) {
                        currentBuild.result = 'SUCCESS'
                    } else {
                        currentBuild.result = 'FAILURE'
                    }
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

