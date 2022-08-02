pipeline {
    agent {label "docker-builder"}
    stages {
        stage('Building the docker image') {
            steps{                
                // building the docker image
                sh '''
                    docker build -t alaaamin/reload-count-tornado-py-app .
                '''
            }   
        }
        stage('Pushing the image to docker hub') {
            steps {                
                // pushing the image
                sh '''
                    docker push alaaamin/reload-count-tornado-py-app
                '''
            }
        }

        stage('Deploying to the cluster'){
            steps{
                sh ''' 
                    kubectl apply -f kubernetes/deployment.yaml
                    kubectl apply -f kubernetes/service.yaml
                '''
            }
        }
        stage('service external ip'){
            steps{
                sh ''' 
                    kubectl get svc py-tornado-rc-svc
                '''
            }
        }
    }
}
