pipeline {
	environment {
		DOCKER_IMAGE = "gourav-bhardwaj/sp-jenkins-demo"
		DOCKER_CRED = credentials('DOCKER_CRED')
	}
	/*
     * Run everything on an existing agent configured with a label 'docker'.
     * This agent will need docker, git and a jdk installed at a minimum.
     */
    agent {
        node {
            label 'docker'
        }
    }
	// using the Timestamper plugin we can add timestamps to the console log
    options {
        timestamps()
    }
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
		stage('Docker Image Build And Publish') {
           steps {
				sh """
				docker login -u $DOCKER_CRED_USR -p $DOCKER_CRED_PSW
				docker build -t $DOCKER_IMAGE:$BUILD_NUMBER
				docker build -t $DOCKER_IMAGE:latest
				docker push $DOCKER_IMAGE:$BUILD_NUMBER
				docker push $DOCKER_IMAGE:latest
				"""
		   }
        }
    }
}