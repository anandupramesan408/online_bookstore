pipeline {  
    agent any  
	tools{
		jdk "JDK17"
        maven "MAVEN3.9"
	}
	environment{
		SONARSERVER = 'sonarserver'
        SONARSCANNER = 'sonarscanner'
		SONAR_SCANNER_OPTS="--add-opens java.base/java.lang=ALL-UNNAMED"

	}
        stages {  
       	    stage('git_checkout') {  
           	    steps {  
              	    echo "cloning repository" 
              	    git branch: 'master',
					url: 'https://github.com/anandupramesan408/online_bookstore.git',
					credentialsId: 'gitlogin'
              	    }  
         	    } 
				stage('build')
				{
					steps{
						echo "building..."	
						sh "mvn clean compile"

					}

				}
				stage('Unit Test')
				{
				steps{
					echo "Testing.."
					sh 'mvn test'
				}
				}
				stage('Code analysis with sonarqube')
				{
					environment {
             		scannerHome = tool 'onlinebookstore'
					          }

					steps{
						withSonarQubeEnv("${SONARSERVER}") {
							
               		 sh '''${scannerHome}/bin/sonar-scanner \
  							-Dsonar.projectKey=onlinebookstore \
  							-Dsonar.projectName=onlinebookstore \
  							-Dsonar.projectVersion=1.0 \
  							-Dsonar.sources=src/ \
  							-Dsonar.java.binaries=target/classes'''

           		 				}}

            		
						
					}
				stage('Deploy'){
					steps{

						echo "Deploy to the server..."
					}
				}

        }
}
