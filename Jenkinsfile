pipeline {
	agent any
	environment {
		REGISTRY = 'gourav-bhardwaj/sp-jenkins-demo'
		DOCKER_CRED = 'DOCKER_CRED'
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
		stage("Docker Push") {
			steps {
				sh """
					docker login -u $DOCKER_CRED_USR -p $DOCKER_CRED_PSW
					docker push $REGISTRY:$BUILD_NUMBER
					docker push $REGISTRY:latest
					docker rmi $REGISTRY:$BUILD_NUMBER
					docker rmi $REGISTRY:latest
				"""
			}
		}
	}
}