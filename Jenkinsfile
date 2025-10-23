pipeline {
  agent any

  environment {
    TF_HOME = "${WORKSPACE}/terraform"
  }

  stages {
    stage('Checkout') {
      steps {
        git url:'https://github.com/Parvez1604/jenkins-terraform-deploy.git'
      }
    }

    stage('Terraform Init & Plan') {
      steps {
        sh 'terraform init'
        sh 'terraform plan'
      }
    }

    stage('Apply Infrastructure') {
      steps {
        sh 'terraform apply -auto-approve'
      }
    }

    stage('Post Deployment') {
      steps {
        echo "App deployed successfully on AWS EC2!"
      }
    }
  }

  post {
    always {
      echo "Cleaning up workspace..."
    }
  }
}
