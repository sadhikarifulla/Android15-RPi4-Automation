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
            archiveArtifacts artifacts: 'out-jenkins/target/product/rpi4/*.img', fingerprint: true
            echo 'Android Build Completed Successfully'
        }

        failure {
            echo 'Android Build Failed'
        }

        always {
            echo 'Pipeline Finished'
        }
    }
}
