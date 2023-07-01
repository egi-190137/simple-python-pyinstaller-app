node {
    docker.image('python:2-alpine').inside(' -p 8000:8000') {
        stage('Build') { 
            sh 'python -m py_compile sources/add2vals.py sources/calc.py'
        }
    }
}
node {
    docker.image('qnib/pytest').inside(' -p 8000:8000') {
        stage('Test') {
            sh 'py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'           
        }
        stage('Manual Approval') {
            input message: 'Lanjutkan ke tahap Deploy?”'
        }
    }
}
node {
    docker.image('cdrx/pyinstaller-linux:python2').inside('-p 8000:8000') {
        stage('Deploy') {
            sh 'pyinstaller --onefile sources/add2vals.py'
            sh 'echo $! > .pidfile'
            sh 'sleep 1m'
            sh 'kill $(.pidfile)'
        }
    }
}