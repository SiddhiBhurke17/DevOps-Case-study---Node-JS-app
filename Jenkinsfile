pipeline {
  agent any

  environment {
    IMAGE_NAME = 'siddhi17/nodejs-app'
  }

  triggers {
    // Optional: Run every hour
    cron('H 1 * * *')
  }

  stages {
    stage('Clean Workspace') {
      steps {
        cleanWs()
      }
    }

    stage('Clone Repo') {
      steps {
        git branch: 'main', credentialsId: 'Siddhi_git_creds', url: 'https://github.com/SiddhiBhurke17/DevOps-Case-study---Node-JS-app'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh '''
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            docker push $IMAGE_NAME
          '''
        }
      }
    }

    stage('Deploy with Ansible') {
  steps {
    sh '''
      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ansible/hosts.ini ansible/deploy.yml
    '''
  }
}
  }
}

