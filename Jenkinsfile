pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'maven:3.8.5-eclipse-temurin-17'
    GIT_REPOSITORY = 'https://github.com/NetecGit/devops_240206.git'
    GIT_BRANCH = 'practica-4.2'
  }

  stages {
    stage('Clonar Repositorio') {
      steps {
        git branch:"${GIT_BRANCH}", url:"${GIT_REPOSITORY}"
      }
    }
    stage('Compilar Proyecto') {
      steps {
        script {
          docker.image("${DOCKER_IMAGE}").inside {
            sh 'mvn clean package -Dmaven.test.skip=true -B -ntp'
          }
        }
      }
    }
    stage('Archivar Artefacto') {
      steps {
          archiveArtifacts artifacts: '**/target/*.jar'
      }
    }
   stage('Enviar DockerHub') {
      steps {
        script {
          
          //def pom = readMavenPom file: 'pom.xml'
          def app = docker.build("blankiss/crudimage:v5.0")

          docker.withRegistry('https://registry.hub.docker.com/', 'dockerhub-credentials') {
          app.push()
       
          }
        }
      }
    }
  }

  post {
    success {
      echo 'La compilación, el archivado del artefacto e imagen Docker Hub fueron exitosos.'
    }
    failure {
      echo 'Algo falló'
    }
  }
}
