FROM registry.access.redhat.com/ubi8/ubi-minimal:8.4 as clowdRun
WORKDIR /work

RUN microdnf install git golang make
RUN git clone https://github.com/lindgrenj6/clowdRunner.git && \
    cd clowdRunner && make

FROM debian:sid-slim
RUN apt update && \
    apt install -y kafkacat jq && \
    apt clean all

COPY --from=clowdRun /work/clowdRunner/clowdRun /bin/clowdRun
COPY ./kafkacat.sh /bin/kafkacat.sh

CMD ["/bin/kafkacat.sh"]
