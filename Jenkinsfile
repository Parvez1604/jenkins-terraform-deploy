pipeline {
    agent {
    docker {
      image 'hashicorp/terraform:latest'
      args '-u root:root'
    }
  }

  environment {
    TF_HOME = "${WORKSPACE}/terraform"
  }

  stages {
      stage('Checkout') {
      steps {
        git 'https://github.com/YOUR_USERNAME/jenkins-terraform-deploy.git'
      }
      }

    stage('Terraform Init & Plan') {
       steps {
    dir("${TF_HOME}") {
      sh 'terraform init'
      sh 'terraform plan'
    }
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
