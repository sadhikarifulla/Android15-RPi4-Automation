pipeline {
    agent any

    options {
        timestamps()
    }

    stages {

        stage('Checkout Pipeline') {
            steps {
                checkout scm
            }
        }

        stage('Android Build') {
            steps {
                sh '''
                    chmod +x scripts/build.sh
                    ./scripts/build.sh
                '''
            }
        }
    }

    post {
        success {
            echo '========================================='
            echo ' Android Build Completed Successfully'
            echo '========================================='
        }

        failure {
            echo '========================================='
            echo ' Android Build Failed'
            echo '========================================='
        }

        always {
            echo 'Pipeline Finished'
        }
    }
}
