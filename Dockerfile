FROM rabbitmq:3.8-management

WORKDIR /plugins/
RUN apt-get -q update && \
  apt-get -y -q install --no-install-recommends \
  curl=7.58.0-2ubuntu3.8 ca-certificates=20180409 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* 

RUN curl https://google.com
RUN curl -sLo rabbitmq_delayed_message_exchange.ez https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/v3.8.0/rabbitmq_delayed_message_exchange-3.8.0.ez 
RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange

RUN apt-get autoremove --purge -y curl ca-certificates
