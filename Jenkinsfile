pipeline {
  agent any

  environment {
    HELM_HOME = "${WORKSPACE}/.helm"
    KUBECONFIG = "${WORKSPACE}/.kube/config"
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/pedrohk/devops-kata', branch: 'main'
      }
    }

    stage('Unit Tests') {
      steps {
        sh 'make test'
      }
    }

    stage('OpenTofu Init & Validate') {
      steps {
        dir('infrastructure') {
          sh 'tofu init'
          sh 'tofu validate'
        }
      }
    }

    stage('OpenTofu Test') {
      steps {
        dir('infrastructure') {
          sh 'tofu test'
        }
      }
    }

    stage('OpenTofu Apply') {
      steps {
        dir('infrastructure') {
          sh 'tofu apply -auto-approve'
        }
      }
    }

    stage('Helm Infra') {
      steps {
        dir('charts/infra') {
          sh 'helm upgrade --install monitoring . -n infra'
        }
      }
    }

    stage('Helm Deploy') {
      steps {
        dir('charts/app') {
          sh 'helm upgrade --install app-release . -n apps'
        }
      }
    }
  }
}