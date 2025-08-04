devops-kata
├── .github
│   └── workflows
│       └── docker-build-push.yml
├── charts
│   ├── app
│   │   ├── Chart.yaml
│   │   ├── templates
│   │   │   ├── _helpers.tpl
│   │   │   └── tests
│   │   │       └── test-connection.yaml
│   │   └── values.yaml
│   └── infra
│       ├── Chart.yaml
│       └── values.yaml
├── infrastructure
│   ├── main.tf
│   ├── variables.tf
│   └── tests
│       └── integration_test.tftest.hcl
├── sample-app
│   ├── main.go
│   ├── Dockerfile
│   └── Makefile
├── Jenkinsfile
└── README.md