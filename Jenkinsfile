pipeline {
    agent any

    environment {
        AOSP = "/home/scl/aosp"
    }

    options {
        timestamps()
    }

    stages {
        stage('Build Android') {
            steps {
                sh '''
                bash -c '
                    set -e

                    cd "$AOSP"

                    source build/envsetup.sh

                    lunch aosp_rpi4-ap4a-userdebug

                    m -j8
                '
                '''
            }
        }
    }

    post {
        success {
            echo 'Android build completed successfully.'
        }

        failure {
            echo 'Android build failed.'
        }
    }
}
