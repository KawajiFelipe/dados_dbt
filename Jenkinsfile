pipeline {
    agent any
    
    // Variáveis de ambiente
    environment {
        HOP_CONTAINER = 'hop-web'
        HOP_PROJECT   = 'projeto_dados_dbt'
        HOP_ENV       = 'DEV'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Garante que o Jenkins tenha a versão mais recente do seu código/workflows
                checkout scm
            }
        }

        stage('Rodar Hop (Bronze)') {
            steps {
                echo "Iniciando Extração de Dados - Projeto: ${HOP_PROJECT}"
                // Adicionada a / antes de opt e corrigido o caminho do arquivo se necessário
                sh "docker exec ${HOP_CONTAINER} /usr/local/tomcat/webapps/ROOT/hop-run.sh -j ${HOP_PROJECT} -e ${HOP_ENV} -f /files/projects/projeto_dados/workflows/stage_hr.hwf -r local"
            }
        }

    post {
        failure {
            echo "A pipeline falhou. Verifique os logs do Hop ou dbt."
        }
        success {
            echo "Pipeline executada com sucesso!!"
            }
        }
    }
}