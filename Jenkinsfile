pipeline{
    agent any
    tools{
        maven 'M3'
    }
    environment{
        //variables de entorno
        git_uri='https://github.com/Bautistadev/MIcroService_properties-configuration'
    }
    stages{
        stage('checkout'){
            steps{
                git branch: 'main', credentialsId: 'bautistadevgithub', url: 'https://github.com/Bautistadev/Microservice_configuration-Service'
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean package -DskipTest=true -f pom.xml -Dmy.env.variable=$git_uri'
            }
        }
        stage('test'){
            steps{
                sh 'mvn test -Dmy.env.variable=$git_uri'
            }
        }
        stage('docker build'){
           steps{
               script{
                   sh 'echo ${BUILD_NUMBER}'
                   docker.image("bautistadev/configuration_microservice:v${BUILD_NUMBER}")

               }
           }
        }
    }
    post{
        always{
            echo 'Pipeline finalizado'
        }
        success{
            echo 'Ejecucion exitosa !!'
        }
        failure{
            script{
                if(currentBuild.result == 'FAILURE'){
                    echo 'EL STAGE : '+env.STAGE_NAME+ ' HA FALLADO'
                }
            }
        }
    }
}