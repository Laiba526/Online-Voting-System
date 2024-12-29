pipeline {
    agent any  // This tells Jenkins to run the pipeline on any available agent

    environment {
        // Define any environment variables, if needed
        DEPLOY_ENV = 'production'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the latest code from the Git repository
                git branch: 'main', url: 'https://github.com/Laiba526/Online-Voting-System.git'
            }
        }

        stage('Build') {
            steps {
                // Run your build commands here (e.g., for a Maven or Node.js project)
                sh 'mvn clean install'  // Example for Java-based Maven project
            }
        }

        stage('Test') {
            steps {
                // Run your test commands (e.g., unit tests, integration tests)
                sh 'mvn test'  // Example for Maven project
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the built application
                sh './deploy.sh'  // Replace with your deployment script/commands
            }
        }

        stage('Notify') {
            steps {
                // Send notifications (e.g., Slack or email) about build status
                slackSend(channel: '#builds', message: 'Build and deployment completed successfully!')
            }
        }
    }

    post {
        always {
            // Clean up resources if needed
            echo 'Cleaning up...'
        }

        success {
            // Actions on success, such as sending notifications
            echo 'Build succeeded!'
        }

        failure {
            // Actions on failure (e.g., notify team about failure)
            echo 'Build failed!'
        }
    }
}
