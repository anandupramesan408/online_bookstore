pipeline {  
    agent any  
	tools{
		jdk "JDK17"
        maven "MAVEN3.9"
	}
        stages {  
       	    stage("git_checkout") {  
           	    steps {  
              	    echo "cloning repository" 
              	    git branch: 'main',
					url: 'https://github.com/anandupramesan408/online_bookstore.git',
					credentialsId: 'gitlogin'
              	    }  
         	    } 
				stage('build')
				{
					steps{
						echo "building..."	

					}

				}
				stage('Test')
				{
				steps{
					echo "testing"
				}
				}
				stage('Deploy'){
					steps{

						echo "deplloy"
					}
				}

        }
}
