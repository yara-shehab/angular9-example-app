node {
   def BRANCH_NAME = 'default'
   def REG = "registry.gitlab.com/digitalw/caresquare-backoffice"
   stage('Preparation') {
       git branch: '$BRANCH_NAME',
    credentialsId: 'githubDeployerUser',
    url: 'https://github.com/yara-shehab/angular9-example-app.git'

   }

   stage('Build') {
        sh "docker build . -t myapp "
  }
    stage('Tag and Push Image to GITHUB'){
       sh("docker login registry.gitlab.com -u dgwell -p dgwell01")
       sh("docker tag myapp  $REG:$BRANCH_NAME$BUILD_NUMBER")
       sh("docker tag $REG:$BRANCH_NAME$BUILD_NUMBER $REG:latest")
       sh("docker push $REG:$BRANCH_NAME$BUILD_NUMBER")
       sh("docker push $REG:latest")
   }
   stage('Transfer files and deploy'){
       sh("gcloud container clusters get-credentials caresquarepp --zone us-central1-a --project caresquare-64cff")
       sh("kubectl apply -f deployment.yml -n frontend")
       sh("kubectl set image deployment/myapp myapp=$REG:$BRANCH_NAME$BUILD_NUMBER -n frontend")
   }
}
