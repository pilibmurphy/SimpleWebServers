FROM ruby:latest

RUN gem install addressable json

COPY ./app /app

WORKDIR /app

COPY ./app /app

EXPOSE 5000

ENTRYPOINT ["ruby"]
CMD ["app.rb"]