pipeline {
    agent any
    stages {
        stage('git checkout') {
            steps{
                 git url: 'https://github.com/akas194-git/k8s-Jenkins',
                     branch: 'master',
                     credentialsId: 'git-cred'

            }
        }
        stage('docker image build and deploy'){
            steps{
                script{
                sh 'docker build -t akas194/test:v1 .'
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'pwd')]) {
                         sh "docker login -u akas194 -p ${pwd}"
                    }
                sh 'docker push akas194/test:v1'

                }

            }
        }
        stage('deploy to k8s')
            steps{
                sh 'set +x'
                sh 'kubectl rollout history deployment pulfrmmydkrh'
                sh 'kubectl set image deployment/pulfrmmydkrh pulfrmmydkrh = akas194/test:${BUILD_NUMBER}'
                sh 'kubectl rollout status --watch=true deployment pulfrmmydkrh '
                sh 'kubectl rollout history deployment pulfrmmydkrh'
            }
    }
}
