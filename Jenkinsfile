pipeline {
    agent any  // Run on any available agent

    environment {
        DEPLOY_ENV = 'production'
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the Git repository
                git branch: 'main', url: 'https://github.com/Laiba526/Online-Voting-System.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install PHP dependencies using the build.bat file
                bat 'build.bat'
            }
        }

        stage('Test') {
            steps {
                // Run PHP unit tests
                bat 'vendor\\bin\\phpunit --configuration phpunit.xml'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the application (replace with your deployment commands)
                echo 'Deploying application...'
                // Example: FTP or SCP commands to move files to a server
            }
        }

        stage('Notify') {
            steps {
                // Send notifications
                echo 'Build and deployment completed successfully!'
            }
        }
    }

    post {
        always {
            // Clean up resources if needed
            echo 'Cleaning up workspace...'
        }

        success {
            echo 'Pipeline succeeded!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }
}
