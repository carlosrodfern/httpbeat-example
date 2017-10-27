FROM alpine

ADD https://github.com/christiangalsterer/httpbeat/releases/download/4.0.0/httpbeat-4.0.0-linux-x86_64.tar.gz /apps/httpbeat/httpbeat.tar.gz
WORKDIR /apps/httpbeat
RUN \
  tar -zxvf httpbeat.tar.gz --strip 1 && \
  rm -rf httpbeat.tar.gz
WORKDIR /

ADD httpbeat.yml /apps/httpbeat/
ADD httpbeat.template.json /apps/httpbeat/
RUN chmod go-w /apps/httpbeat/httpbeat.yml

CMD ["/apps/httpbeat/httpbeat", "-e", "-c", "/apps/httpbeat/httpbeat.yml"]