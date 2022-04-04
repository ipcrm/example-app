pipeline {
  agent { label 'agent' }
  stages {
    stage('run detc') {
      steps {
        sh 'detc create --plan https://raw.githubusercontent.com/ipcrm/example-app/main/plans/example_app_attack_infra-aws.yml --apply --trace'
      }
    }
  }
}

