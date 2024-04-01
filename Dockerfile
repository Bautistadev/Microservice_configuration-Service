FROM debian


RUN apt -y update
RUN apt -y upgrade
RUN apt install -y htop
RUN apt install -y net-tools
RUN apt install -y ssh
RUN apt install -y mc
RUN apt install -y git
RUN apt install -y openjdk-17-jdk
RUN apt install -y maven


##creamos directorio data que va a tener la aplicacion
RUN mkdir /data
WORKDIR /data

##clonamos el directorio
RUN git clone https://github.com/Bautistadev/Microservice_configuration-Service.git
#ingresamos en la variable de entorno la url del repositorio con las properties de los microservicios
ENV git_uri https://github.com/Bautistadev/MIcroService_properties-configuration



ENTRYPOINT ["/bin/bash"]

