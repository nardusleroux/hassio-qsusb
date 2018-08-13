FROM resin/rpi-raspbian:latest
ENV LANG C.UTF-8

WORKDIR /qsusb
# Install requirements for add-on
RUN apt-get update && apt-get install unzip && apt-get install jq && apt-get install wget 
RUN apt-get install libusb-1.0
RUN wget https://cdn.shopify.com/s/files/1/1883/0535/files/qsusb_pi_V1.91.zip
RUN unzip qsusb_pi_V1.91.zip

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
