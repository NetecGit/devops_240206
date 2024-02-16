pipeline {
    agent any

    tools {
        maven 'Maven3.8.8'
    }

    stages {
        stage('Clonando ...') {
            steps {
                git branch:'practica-4.2', url:'https://github.com/NetecGit/devops_240206.git'
            }
        }
        stage('COmpilando...') {
            steps {
                sh 'mvn clean compile -B -ntp'
            }
        }
        stage('Probando...') {
            steps {
                sh 'mvn test -B -ntp'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package -DskipTests -B -ntp'
            }
        }
        stage('Artifactory...') {
            steps {
                script {
                    sh 'env | sort'

                    def server = Artifactory.server 'artifactory2'
                    def repository = 'demo-repo'

                    if ("${GIT_BRANCH}" == 'origin/master') {
                        repository = repository + '-release'
                    } else {
                        repository = repository + '-snapshot'
                    }

                    def uploadSpec = """
                        {
                            "files": [
                                {
                                    "pattern": "target/.*.jar",
                                    "target": "${repository}",
                                    "regexp": "true"
                                }
                            ]
                        }
                    """
                    server.upload spec: uploadSpec
                }
            }
        }
    }
    post {
        success {
            archiveArtifacts artifacts: 'target/*.jar'
            deleteDir()
        }
    }
}
