pipeline{
    agent any
    
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

            agent { label 'build-agent-docker' }

            steps{
                echo "Building docker image..."
                sh """

                docker compose -f docker-compose-build.yml build


                """
            }

        }
    }
}