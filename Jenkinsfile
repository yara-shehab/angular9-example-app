node {
   def GIT_REG = "github.com/yara-shehab/angular9-example-app"
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
       git branch: 'master',
    url: 'https://github.com/yara-shehab/angular9-example-app.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
   }
   stage('Build') {
        sh("docker build -t myapp .")
  }
    stage('Tag and Push Image to GITHUB'){
       sh("docker tag myapp  $REG:$BRANCH_NAME$BUILD_NUMBER")
       sh("docker tag $REG:$BRANCH_NAME$BUILD_NUMBER $REG:latest")
       sh("docker push $REG:$BRANCH_NAME$BUILD_NUMBER")
       sh("docker push $REG:latest")
   }
   stage('Transfer files and deploy'){
       sh("gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project coffee-fpal")
       sh("kubectl apply -f deployment.yml")
       sh("kubectl set image deployment/myapp myapp=$REG:$BUILD_NUMBER")
   }
}
