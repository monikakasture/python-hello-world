pipeline {
    agent { node {label 'prod1'} }
    environment {
        registry = "177650971626.dkr.ecr.ca-central-1.amazonaws.com/myrepo"
    }
   
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/nishant']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kasturenishant/Project.git']]])     
            }
        }
  
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
   stage('Pushing to ECR') {
     steps{  
         script {
                sh 'aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 177650971626.dkr.ecr.ca-central-1.amazonaws.com'
                sh 'docker push 177650971626.dkr.ecr.ca-central-1.amazonaws.com/myrepo:latest'
         }
        }
      }
   
         // Stopping Docker containers for cleaner Docker run
     stage('stop previous containers') {
         steps {
            sh 'docker ps -f name=mypythonContainer -q | xargs --no-run-if-empty docker container stop'
            sh 'docker container ls -a -fname=mypythonContainer -q | xargs -r docker container rm'
         }
       }
      
    stage('Docker Run') {
     steps{
         script {
                sh 'docker run -d -p 8096:5000 --rm --name NKpythonContainer 177650971626.dkr.ecr.ca-central-1.amazonaws.com/myrepo'
            }
      }
    }
    }
}
