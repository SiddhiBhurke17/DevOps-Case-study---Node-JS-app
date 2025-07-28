pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'siddhi17/nodejs-app'
    }

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
           steps {
               withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-creds'
                ]]) {
                    dir('infra') {
                        sh '''
                            export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                            export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                            terraform init
                            terraform apply -auto-approve
                        '''
                    }
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
    }
}

