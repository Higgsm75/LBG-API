pipeline {
	agent any
	stages{
		stage('Build Image'){
			steps{
			sh 'docker build -t gcp.io/lbg210222/api:v2 -t gcp.io/lbg210222/api:v2-$BUILD_NUMBER .'
			}
		}
		stage('Push to Dockerhub'){
			steps{
            sh 'docker push gcp.io/lbg210222/api:v2-$BUILD_NUMBER'
			sh 'docker push gcp.io/lbg210222/api:v2
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
             sh 'docker push gcp.io/lbg210222/api:v2
			 sh 'docker push gcp.io/lbg210222/api:v2-$BUILD_NUMBER'
			}
		}
    }
}
