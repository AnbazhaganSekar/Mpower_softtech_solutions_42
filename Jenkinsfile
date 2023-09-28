pipeline {
    parameters {
        choice(name: 'ENVIRONMENT', choices: "dev\nstage\nprod", description: 'Select the environment for deployment')
    }

    agent any

    stages {
        stage('Git SCM') {
            steps {
                git 'https://github.com/AnbazhaganSekar/Mpower_softtech_solutions_42.git'
            }
        }

        stage('Docker Build') {
            matrix {
                axes {
                    axis {
                        name: 'ENVIRONMENT'
                        values: 'dev', 'stage', 'prod'
                    }
                }
                stages {
                    stage("Build ${ENVIRONMENT}") {
                        when {
                            expression {
                                return ENVIRONMENT == 'dev' || ENVIRONMENT == 'stage' || ENVIRONMENT == 'prod'
                            }
                        }
                        steps {
                            script {
                                def imageTag = "${ENVIRONMENT}-myapp:${BUILD_NUMBER}"
                                sh "docker build -t ${imageTag} ."
                                sh "docker push ${imageTag}"
                            }
                        }
                    }
                }
            }
        }

        stage('Deployment') {
            when {
                expression {
                    return ENVIRONMENT == 'dev' || ENVIRONMENT == 'stage' || ENVIRONMENT == 'prod'
                }
            }
            steps {
                script {
                    def imageTag = "${ENVIRONMENT}-myapp:${BUILD_NUMBER}"
                    // Deploy the Docker container to the selected environment
                    // Add deployment steps for each environment here
                }
            }
        }
    }

    post {
        failure {
            emailext (
                subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                body: "The Jenkins pipeline ${currentBuild.fullDisplayName} has failed. Please investigate and take appropriate action.",
                to: "anbuprofessional1996@gmail.com",
                attachLog: true
            )
        }
        success {
            emailext (
                subject: "Pipeline Successful: ${currentBuild.fullDisplayName}",
                body: "The Jenkins pipeline ${currentBuild.fullDisplayName} has successfully completed.",
                to: "anbuprofessional1996@gmail.com"
            )
        }
    }
}
