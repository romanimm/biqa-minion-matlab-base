FROM ubuntu:16.04

RUN  apt-get update -y && \
     apt-get install -y openjdk-8-jre wget unzip && \
     apt-get autoclean -y && \
     apt-get clean -y && \
     apt-get autoremove -y


RUN  mkdir -p /opt/matlabInstall && cd /opt/matlabInstall && \
     wget -O matlab.zip -o out.log "https://ch.mathworks.com/supportfiles/downloads/R2016b/deployment_files/R2016b/installers/glnxa64/MCR_R2016b_glnxa64_installer.zip" && \
     unzip matlab.zip && \
     ./install -mode silent -agreeToLicense yes -destinationFolder /opt/matlab && \
     rm -rf /opt/matlabInstall
     
ENV MATLAB /opt/matlab/v91



WORKDIR /usr/src/myapp
