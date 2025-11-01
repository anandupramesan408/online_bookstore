pipeline {  
    agent any  
	tools{
		jdk "JDK17"
        maven "MAVEN3.9"
	}
	environment{
		SONARSERVER = 'sonarserver'
        SONARSCANNER = 'sonarscanner'

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
						sh "mvn clean package"

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
						withSonarQubeEnv('${SONARSERVER}') {
							withEnv(["SONAR_SCANNER_OPTS=--add-opens java.base/java.lang=ALL-UNNAMED"]){
               sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=onlinebookstore \
                   -Dsonar.projectName=oninebookstore \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
           		 }

            		timeout(time: 10, unit: 'MINUTES') {
              		 waitForQualityGate abortPipeline: true
            		}
						}
					}
				}
				stage('Deploy'){
					steps{

						echo "deplloy"
					}
				}

        }
}
}