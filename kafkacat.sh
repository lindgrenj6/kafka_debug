#!/usr/bin/env bash
set -x

BROKER=$(clowdRun env | grep KAFKA_BROKERS | cut -d= -f2)
TOPIC=$(clowdRun env | grep TOPIC_NAME | grep event-stream | cut -d= -f2)

kafkacat -b $BROKER -t $TOPIC -o beginning -C \
  -f '\nKey (%K bytes): %k
  Value (%S bytes): %s
  Timestamp: %T
  Partition: %p
  Offset: %o
  Headers: %h\n'
