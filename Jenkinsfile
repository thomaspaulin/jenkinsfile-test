pipeline {
    agent { 
        dockerfile {
            filename 'Dockerfile'
        } 
    }
    environment { 
//        LAMBDA_TASK_ROOT = '/var/task'
    }
    stages {
        stage('Test') {
            steps {
		sh 'env'
                // the test requirements aren't installed into the docker image during the build step in order to reduce size
                sh 'pip install -r tests/requirements.txt --target "${LAMBDA_TASK_ROOT}/libs"'
                sh 'pytest tests/'
            }
        }
    }
}
