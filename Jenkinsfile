pipeline {
  agent { label 'agent' }
  stages {
    stage('run detc') {
      steps {
        shell('detc create --plan https://raw.githubusercontent.com/ipcrm/example-app/main/plans/example_app_attack_infra-aws.yml --plan https://raw.githubusercontent.com/lacework-dev/detc-resources/main/plans/k8s/eks.yaml')
      }
    }
  }
}

