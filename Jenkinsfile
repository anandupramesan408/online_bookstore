pipeline{
    
    agent { label 'build-agent-docker' }
        
    stages{
        stage("git_checkout")
        {
        steps{
            echo "cloning to repo" 
            git branch: 'docker-cicd',
			url: 'https://github.com/anandupramesan408/online_bookstore.git',
			credentialsId: 'gitlogin'
        }
        }
        stage("build"){

            steps{
                echo "Building docker image...."
                sh """

                export BUILD_NUMBER=${BUILD_NUMBER}
                docker compose -f docker-compose-build.yml build --build-arg BUILD_NUMBER=${BUILD_NUMBER}
                docker tag anandu408/onlinebook:v1.${BUILD_NUMBER} anandu408/onlinebook:latest
                docker push anandu408/onlinebook:v1.${BUILD_NUMBER}
                docker push anandu408/onlinebook:latest
                docker image prune -a -f
                

                """
            }


        }
         stage ("Deploy"){

                agent { label 'deployment-node' }

            steps {

                echo "Deploying the app"

                  sh """

                   echo "DEBUG: who am I and what groups do I have?"
                        id
                        groups
                        ls -l /var/run/docker.sock

                        echo "Trying docker ps..."
                        docker ps

                        hostname

                // docker-compose -f docker-compose-run.yml up -d

                     """
                }

        }
        
    }
}