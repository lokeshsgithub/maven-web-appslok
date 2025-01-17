pipeline {

    agent any 

    tools {
       maven 'maven3.9.0'
    }

    stages{

        stage('Checkout code') {

            steps{
                
                git credentialsId: 'Jenkins_Github_crd',
                url: ' https://github.com/lokeshsgithub/maven-web-appslok.git'
            }
        }

        stage('Unit test: Maven') {
            steps {
                sh "mvn test"
            }
        }

        stage('Integration test cases') {
            steps{
                sh "mvn verify -DskipUnitTests"
            }
        }
        stage('Build the package') {
            steps{
                sh "mvn clean validate"
            }
        }

        stage('sonarqube analysis') {
            steps{
                withSonarQubeEnv(credentialsId: 'sonar_auth',installationName: 'sonarqube') {
                sh "mvn clean package sonar:sonar"
            }
          }
        }

        stage('quality gate analysis') {
            steps{
                waitForQualityGate abortPipeline: false, credentialsId: 'sonar_auth'
            }
        }

        stage('nexus uploader') {
            steps{
                nexusArtifactUploader artifacts: 
                [
                    [
                        artifactId: 'json',
                        classifier: '', file: 'target/*.war',
                        type: 'json'
                    ]
                ],
                credentialsId: 'Nexus_crd',
                groupId: 'com.mt',
                nexusUrl: '3.110.92.215:8081',
                nexusVersion: 'nexus3',
                protocol: 'http',
                repository: 'mavenapp-release',
                version: '1.0.0'
            }
        }

   }
}