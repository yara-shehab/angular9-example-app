node {

   stage('Build') {
        sh("git clone https://github.com/yara-shehab/angular9-example-app ")
        sh("cd angular9-example-app/ ")
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
       sh("kubectl set image deployment/myapp myapp=$REG:$BRANCH_NAME$BUILD_NUMBER -n frontend")
   }
}
