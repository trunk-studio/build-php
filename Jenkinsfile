pipeline {
    agent {
        label "jenkins-jx-base"
    }
    environment {
        ORG         = 'trunksys'
        APP_NAME    = 'builder-php'
    }
    stages {
        stage('CI Build and push snapshot') {
            when {
                branch 'PR-*'
            }
            steps {
                container('jx-base') {
                    sh "docker build -t docker.io/$ORG/$APP_NAME:SNAPSHOT-$BRANCH_NAME-$BUILD_NUMBER ."
                    sh "docker push docker.io/$ORG/$APP_NAME:SNAPSHOT-$BRANCH_NAME-$BUILD_NUMBER"
                }
            }
        }
    
        stage('Build and Push Release') {
            when {
                branch 'master'
            }
            steps {
                container('jx-base') {
                    sh "jx step git credentials"
                    sh "sh ./jx/scripts/release.sh"
                }
            }
        }
    }
//     post {
//         failure {
//             input """Pipeline failed.
// We will keep the build pod around to help you diagnose any failures.

// Select Proceed or Abort to terminate the build pod"""
//         }
//     }
}