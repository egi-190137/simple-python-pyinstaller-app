node {
    docker.image('python:2-alpine').inside(' -p 8000:8000') {
        stage('Build') { 
            step {
                sh 'python -m py_compile ./sources/add2vals.py ./sources/calc.py'
            }
        }
    }
    docker.image('qnib/pytest').inside(' -p 8000:8000') {
        stage('Test') {
            step {
                sh 'py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
            
        }
    }
}