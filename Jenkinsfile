/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
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
                    sh 'docker build -t gomycode .'
                }
            }
        }
    }
}
