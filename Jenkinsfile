pipeline {
    agent { 
        dockerfile {
            filename 'Dockerfile'
        } 
    }
    stages {
        stage('Test') {
            steps {
                // the test requirements aren't installed into the docker image during the build step in order to reduce size
                sh 'pip install -r tests/requirements.txt'
                sh 'pytest'
            }
        }
    }
}
