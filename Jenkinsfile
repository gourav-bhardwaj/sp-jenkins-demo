pipeline {
	agent any
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
	}
}