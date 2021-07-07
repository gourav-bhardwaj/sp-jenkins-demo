pipeline {
	environment {
		registry = 'gourav-bhardwaj/sp-jenkins-demo'
		registryCredentials = 'DOCKER_CRED'
		dockerImage = ''
	}
	agent any
	stages {
		stage("Docker Build") {
			steps {
				script {
					dockerImage = docker.build registry
				}
			}
		}
		stage("Docker Push") {
			steps {
				script {
					docker.withRegistry('', registryCredentials) {
						docker.push("$BUILD_NUMBER")
						docker.push("latest")
					}
				}
			}
		}
	}
}