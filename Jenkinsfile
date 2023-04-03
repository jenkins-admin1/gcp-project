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
                sh "cd /var/lib/jenkins/workspace/gcp-project/${params.provider}/${params.environment}/${params.region}/${params.resource to deploy}/${params.application name} && terragrunt init"
                }
        }
        
        stage('validate') 
        {
            steps {
                sh "cd /var/lib/jenkins/workspace/gcp-project/${params.provider}/${params.environment}/${params.region}/${params.resource to deploy}/${params.application name} && terragrunt plan"
                }
        }
        
        stage('apply') 
        {
            steps {
                sh "cd /var/lib/jenkins/workspace/gcp-project/${params.provider}/${params.environment}/${params.region}/${params.resource to deploy}/${params.application name} && terragrunt ${params.action} --auto-approve"
                }
        }
    }
}