pipeline {
	agent any
	environment {
		registry = 'gourav-bhardwaj/sp-jenkins-demo'
		registryCredentials = 'DOCKER_CRED'
		dockerImage = ''
	}
	stages {
		stage("Build") {
			steps {
				sh "chmod +x gradlew"
				sh "./gradlew assemble"
			}
		}
		stage("Test") {
			steps {
				sh "./gradlew test"
			}
		}
		stage("Docker Build") {
			steps {
				sh """
					docker build -t $REGISTRY:$BUILD_NUMBER .
					docker build -t $REGISTRY:latest .
				"""
			}
		}
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
						dockerImage.push("$BUILD_NUMBER")
						dockerImage.push("latest")
					}
				}
			}
		}
	}
}