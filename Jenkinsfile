pipeline {
	environment {
		registry = "gourav-bhardwaj/sp-jenkins-demo"
		registryCredential = 'DOCKER_CRED'
		dockerImage = ''
		dockerImageLatest = ''
	}
    agent any
	trigger {
		pollSCM '* * * * *'
	}	
    stages {
		stage('Build') {
            steps {
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
                docker.withRegistry('', registryCredential) {
					dockerImage.push()
					dockerImageLatest.push()
				}
            }
        }
    }
}