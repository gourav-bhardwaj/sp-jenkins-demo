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
                sh "docker build -t $registry:$BUILD_NUMBER"
				sh "docker build -t $registry:latest"
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
    }
}