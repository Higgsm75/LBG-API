pipeline {
	agent any
	stages{
		stage('Build Image'){
			steps{
			sh 'docker build -t gcr.io/lbg-210222/api:v2 -t gcr.io/lbg-210222/api:v2-$BUILD_NUMBER .'
			}
		}
		stage('Push to Dockerhub'){
			steps{
            sh 'docker push gcr.io/lbg-210222/api:v2-$BUILD_NUMBER'
			sh 'docker push gcr.io/lbg-210222/api:v2'
			 }
		}
		stage('Reapply '){
			steps{
			sh '''kubectl apply -f ./documentation/nginx.yaml
            kubectl apply -f ./documentation/api-deployment.yaml
			kubectl rollout restart deployment/api
            '''
			}
		}
        stage('Cleanup'){
			steps{
             sh 'docker push gcr.io/lbg-210222/api:v2'
			 sh 'docker push gcr.io/lbg-210222/api:v2-$BUILD_NUMBER'
			}
		}
    }
}
