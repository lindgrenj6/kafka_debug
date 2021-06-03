kafkacat -b $QUEUE_HOST:$QUEUE_PORT -t ${1:-platform.sources.event-stream} -o beginning -C \
  -f '\nKey (%K bytes): %k
  Value (%S bytes): %s
  Timestamp: %T
  Partition: %p
  Offset: %o
  Headers: %h\n'
