FROM ruby:3.0.2-alpine3.14

LABEL name=demo-app
ENV INSTALL_PATH=/app/ \
    RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_WITHOUT=development:test \
    SECRET_KEY_BASE=6a12da0330246c126f5d6a2486b707033f2223745a0d08884785e298fb86357b064f0aaa11af69a22209c08652023626991e478314a2104e9505fef962d123ba \
    REDIS_PROVIDER=REDIS_URL \
    RAILS_SERVE_STATIC_FILES=true \
    PORT=80

RUN rm -rf /var/cache/apk/* \
  && rm -rf /tmp/* \
  && apk update

RUN apk add --no-cache --virtual .build-deps build-base yarn \
  && apk add --no-cache nodejs tzdata libxslt-dev libxml2-dev mariadb-dev

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock $INSTALL_PATH

RUN gem install bundler \
  && gem install foreman \
  && bundle install

COPY . $INSTALL_PATH

RUN bin/rails assets:precompile

RUN bin/rails tmp:clear \
  && rm -rf node_modules \
  && apk del .build-deps

EXPOSE $PORT

CMD bin/rails db:migrate db:seed && foreman start

HEALTHCHECK --interval=30s \
            --timeout=10s \
            --start-period=5s \
            --retries=3 \
            CMD /app/.docker/health_check http://localhost/
