FROM alpine:latest

RUN apk --update --no-cache add rsyslog && \
    addgroup -S -g 1514 rsyslog && \
    adduser -S -G rsyslog -u 1514 rsyslog

ADD rsyslog.conf /etc

VOLUME ["/etc/rsyslog.conf.d", "/var/log"]

CMD rm -f /var/run/rsyslogd.pid; /usr/sbin/rsyslogd -n

