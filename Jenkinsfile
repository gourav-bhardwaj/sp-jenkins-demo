pipeline {
	environment {
		registry = "gourav-bhardwaj/sp-jenkins-demo"
		registryCredential = 'DOCKER_CRED'
		dockerImage = ''
		dockerImageLatest = ''
	}
    agent any
    stages {
		stage('Build') {
			agent {
				docker 'gradle:7.1.1-jdk8'
			}
            steps {
                sh 'gradle assemble'
            }
        }
        stage('Test') {
			agent {
				docker 'gradle:7.1.1-jdk8'
			}
            steps {
                sh 'gradle test'
            }
        }
		stage('Docker Image Build') {
            steps {
                script {
					dockerImage = docker.build registry ":$BUILD_NUMBER"
				}
				script {
					dockerImageLatest = docker.build registry ":latest"
				}
            }
        }
		stage('Docker Publish') {
            steps {
				script {
					docker.withRegistry('', registryCredential) {
						dockerImage.push()
						dockerImageLatest.push()
					}
				}
            }
        }
    }
}