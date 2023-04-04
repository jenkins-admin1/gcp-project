pipeline {
    agent any

    stages 
    {
        stage('checkout') 
        {
            steps 
            {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jenkins-admin1/gcp-project.git']])
            }
        }
        
        stage('initialize') 
        {
            steps {
                sh "cd /var/lib/jenkins/workspace/gcp-project/${params.provider}/${params.environment}/${params.application_name}/${params.region}/${params.resource_to_deploy} && terragrunt init"
                }
        }
        
        stage('validate') 
        {
            steps {
                sh "cd /var/lib/jenkins/workspace/gcp-project/${params.provider}/${params.environment}/${params.application_name}/${params.region}/${params.resource_to_deploy} && terragrunt plan"
                }
        }
        
        stage('apply') 
        {
            steps {
                sh "cd /var/lib/jenkins/workspace/gcp-project/${params.provider}/${params.environment}/${params.application_name}/${params.region}/${params.resource_to_deploy} && terragrunt ${params.action} --auto-approve"
                }
        }
    }
}