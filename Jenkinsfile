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

        }
}  