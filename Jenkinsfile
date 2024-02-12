pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven3.8.8"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git branch:'practica-4.2', url:'https://github.com/NetecGit/devops_240206.git'

                // Run Maven on a Unix agent.
                sh "mvn clean package -ntp -Dmaven.test.failure.ignore=true"
            }

            post {
                success {
                    archiveArtifacts 'target/*.jar'
                    cleanWs()
                }
            }
        }
    }
}