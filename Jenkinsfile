pipeline{
    agent any
    tools{
        maven "M3"
        dockerTool "D6"
    }
    environment{
        imageName = "devopsBootcamp"
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
        stage('Build docker image') {
            steps {
                script {
                    sh 'docker build -t $imageName .'
                }
            }
        }
    }
}