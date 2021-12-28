pipeline {

agent any 
    stages {
        stage('git clone project') {
          steps {
                git 'https://github.com/masdp/DevOps_cert_job.git'
          }
        }

        stage('Terraform create ec2') {
          steps {
                sh 'terraform init'
                sh 'terraform plan -out terraform.tfplan'
                sh 'terraform apply terraform.tfplan'
          }
        } 
    
        stage('Ansible build & push image') {
          steps { sh 'ansible-playbook -u ubuntu -i build build.yml --key-file ~/.ssh/aws.pem'
                  }
          }   
        
      
        stage('Ansible deploy on stage') {
          steps { sh 'ansible-playbook -u ubuntu -i stage stage.yml --key-file ~/.ssh/aws.pem'
          }
        }
    }
}