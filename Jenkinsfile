 pipeline {
    stages {
        stage('build image') {
            steps {
              sh 'docker build -t yarashehab/angularapp:v1.0 .'
            }
            }
        stage('push image') {
            steps {
              withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]){
              sh 'docker login --username $USERNAME --password $PASSWORD'
              sh 'docker push yarashehab/angularapp:v1.0'
              }
            }
        }

        stage('deploy') {
          steps {
            sh 'kubectl apply -f deployment.yaml'
        }
        }
    }
