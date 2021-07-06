pipeline {
	environment {
		registry = "gourav-bhardwaj/sp-jenkins-demo"
		registryCredential = 'DOCKER_CRED'
		dockerImage = ''
	}
    agent any
    stages {
		stage('Build') {
            steps {
				sh 'chmod +x gradlew'
                sh './gradlew assemble'
            }
        }
        stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
		stage('Docker Image Build') {
            steps {
                dockerImage = docker.build registry
            }
        }
		stage('Docker Publish') {
            steps {
				script {
					docker.withRegistry('', registryCredential) {
						dockerImage.push(":$BUILD_NUMBER")
						dockerImage.push('latest')
					}
				}
            }
        }
		stage('Remove Unused docker image') {
			steps{
				sh "docker rmi $registry:$BUILD_NUMBER"
				sh "docker rmi $registry:latest"
			}
		}
    }
}