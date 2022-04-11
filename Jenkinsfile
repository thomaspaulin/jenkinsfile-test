pipeline {
    agent { 
        dockerfile {
            filename 'Dockerfile'
        } 
    }
    environment { 
        LAMBDA_TASK_ROOT = '/var/task' // added to match the Dockerfile, but this it's assumed this env in the Dockerfile doesn't change any time soon 
	PATH+EXTRA = '${LAMBDA_TASK_ROOT}/libs/bin'
	PYTHONPATH+EXTRA ='${LAMBDA_TASK_ROOT}/libs'
    }
    stages {
        stage('Test') {
            steps {
                // the test requirements aren't installed into the docker image during the build step in order to reduce size
                sh 'pip install -r tests/requirements.txt --target "${LAMBDA_TASK_ROOT}/libs"'
                sh 'python -m pytest tests/'
            }
        }
    }
}
