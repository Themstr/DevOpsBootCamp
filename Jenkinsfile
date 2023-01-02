pipeline{
    agent any
    tools{
        maven "M3"
        dockerTool "D6"
    }
    environment{
        imageName = "devopsbootcamp"
    }
    stages {
        stage('Git') {
            steps {
                git branch: 'main', url: 'https://github.com/Themstr/DevOpsBootCamp' 
            }
        }
        stage('Build App') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        stage('SonarQube analysis') {
            steps{
                withSonarQubeEnv('asq') {
                    sh "mvn sonar:sonar "
                }
            }
        }
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t $imageName .'
                }
            }
        }
        stage ("Running Microservices"){
            steps{
                script{
                    sh "docker-compose up -d"
                }
            }
         }
    }
}