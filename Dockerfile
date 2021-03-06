FROM ubuntu:16.04

RUN  apt-get update -y && \
     apt-get install -y openjdk-8-jre wget unzip && \
     apt-get clean autoclean -y && \
     apt-get autoremove -y && \
     rm -rf /var/lib/{apt,dpkg,cache,log}/


RUN  mkdir -p /opt/matlabInstall && cd /opt/matlabInstall && \
     wget -O matlab.zip -o out.log "https://ch.mathworks.com/supportfiles/downloads/R2016b/deployment_files/R2016b/installers/glnxa64/MCR_R2016b_glnxa64_installer.zip" && \
     unzip matlab.zip > unzip.log && \
     ./install -mode silent -agreeToLicense yes -destinationFolder /opt/matlab && \
     rm -rf /opt/matlabInstall &&\
     rm -rf /opt/matlab/v91/java && \
     rm -f  /opt/matlab/v91/cefclient/sys/os/glnxa64/glib.tgz
     
ENV MATLAB /opt/matlab/v91



WORKDIR /usr/src/myapp
