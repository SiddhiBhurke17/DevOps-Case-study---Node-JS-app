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

<<<<<<< HEAD
    stage('Clone Repo') {
      steps {
        git branch: 'main', credentialsId: 'Siddhi_git_creds', url: 'https://github.com/SiddhiBhurke17/DevOps-Case-study---Node-JS-app'
      }
=======
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Dockerize') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                        chmod +x build_and_push.sh
                        ./build_and_push.sh
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            environment {
                AWS_ACCESS_KEY_ID = credentials('aws-creds')     // this should match your Jenkins credentials ID
                AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
            }
            steps {
                dir('infra') {
                    sh '''
                        terraform init
                        terraform apply -auto-approve
                    '''
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh 'ansible-playbook -i ansible/hosts.ini ansible/deploy.yml'
                }
            }
        }
>>>>>>> parent of 062a3d9 (🔧 Update Jenkinsfile: Fix AWS creds handling in Terraform stage)
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

