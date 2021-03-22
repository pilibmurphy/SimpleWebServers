FROM ruby:latest

RUN gem install rack

COPY ./app /app

WORKDIR /app

COPY ./app /app

EXPOSE 5000

ENTRYPOINT ["ruby"]
CMD ["app.rb"]