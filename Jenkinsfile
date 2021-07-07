pipeline {
	agent any
	stages {
		stage("Build") {
			steps {
				withGradle {
					sh './gradlew build'
				}
			}
		}
		stage("Test") {
			steps {
				withGradle {
					sh "./gradlew test"
				}
			}
		}
	}
}