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
         stage (Deploy ){

                agent {label ''}


                echo "Deploying the app"

                  sh """

                  hostname

            //     docker-compose -f docker-compose-run.yml up -d

                     """


        }
        
    }
}