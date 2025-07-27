pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'siddhi17/myapp'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build & Dockerize') {
            steps {
                sh 'chmod +x build_and_push.sh'
                sh './build_and_push.sh'
            }
        }

        stage('Terraform Apply') {
            dir('infra') {
                steps {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                sshagent(['ec2-ssh-key']) {
                    sh 'ansible-playbook -i ansible/inventory ansible/deploy.yml'
                }
            }
        }
    }
}

