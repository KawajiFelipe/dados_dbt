pipeline {
    agent any
    
    // Variáveis de ambiente
    environment {
        HOP_CONTAINER = 'hop-web'
        HOP_PROJECT   = 'projeto_dados_dbt'
        HOP_ENV       = 'DEV'
        DBT_CONTAINER = "dbt-dbt-1"
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

        stage('Rodar dbt tests') {
            steps {
                echo "Iniciando testes de qualidade de dados DBT"
                // Adicionada a / antes de opt e corrigido o caminho do arquivo se necessário
                sh "docker exec ${DBT_CONTAINER} dbt test"
            }
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