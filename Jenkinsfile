pipeline {
    agent any
    
    parameters {
        choice(name: 'ENVIRONMENT', choices: 'dev\nstage\nprod', description: 'Select target environment')
    }

    stages {
        stage('Gitscm') {
            steps {
                // Checkout your Git repository here
                git 'https://github.com/AnbazhaganSekar/Mpower_softtech_solutions_42.git'
            }
        }

        stage('Build and Deploy') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            matrix {
                axes {
                    axis {
                        name 'ENVIRONMENT'
                        values 'dev', 'stage', 'prod'
                    }
                }
                stages {
                    stage('Docker Build') {
                        steps {
                            script {
                                def dockerImageName = "myapp:${params.ENVIRONMENT}"
                                // Build Docker image for the specified environment
                                sh "docker build -t $dockerImageName ."
                            }
                        }
                    }
                    stage('Deployment') {
                        steps {
                            script {
                                // Simulate deployment by echoing a message
                                echo "Deploying to ${params.ENVIRONMENT} environment..."
                                // You can add deployment steps specific to your environment here
                            }
                        }
                    }
                }
            }
        }
    }

    post {
        failure {
            // Send email notification on pipeline failure
            emailext subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
                      body: "The pipeline failed for environment: ${params.ENVIRONMENT}. Please investigate.",
                      to: 'anbuprofessional1996@gmail.com',
                      mimeType: 'text/plain'
        }
        success {
            // Send email notification on pipeline success
            emailext subject: "Pipeline Succeeded: ${currentBuild.fullDisplayName}",
                      body: "The pipeline succeeded for environment: ${params.ENVIRONMENT}.",
                      to: 'anbuprofessional1996@gmail.com',
                      mimeType: 'text/plain'
        }
    }
}
