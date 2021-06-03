FROM debian:sid-slim
RUN apt update && \
    apt install -y kafkacat jq && \
    apt clean all

COPY ./kafkacat.sh /bin/kafkacat.sh

CMD ["/bin/kafkacat.sh"]
