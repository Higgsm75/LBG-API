pipeline {
	agent any
	stages{
		stage('Build Image'){
			steps{
			sh 'docker build -t higgsm/api:v2-$BUILD_NUMBER .'
			}
		}
		stage('Push to Dockerhub'){
			steps{
            sh 'docker push higgsm/api:v2-$BUILD_NUMBER'
			}
		}
		stage('Reapply '){
			steps{
			sh '''kubectl apply -f ./documentation/nginx.yaml
            kubectl apply -f ./documentation/api-deployment.yaml
			'''
			}
		}
        stage('Cleanup'){
			steps{
            sh 'docker system prune'
			}
		}
    }
}
