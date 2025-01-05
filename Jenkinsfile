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

        stage('Verify PHP Installation') {
            steps {
                // Verify if PHP is installed and accessible
                bat '"D:\\Program Files\\php\\php-8.4.2-Win32-vs17-x64\\php.exe" -v'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Ensure Composer and PHP are accessible by adding them to the PATH
                withEnv([
                    "PATH+COMPOSER=D:/composer", 
                    "PATH+PHP=D:/Program Files/php/php-8.4.2-Win32-vs17-x64"
                ]) {
                    // Install PHP dependencies using the build.bat file
                    bat 'build.bat'
                }
            }
        }
stage('Verify PHPUnit Installation') {
    steps {
        script {
            // Check if PHPUnit is installed in vendor/bin
            bat 'dir vendor\\bin\\phpunit'
        }
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
