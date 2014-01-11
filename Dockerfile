# This will build the handson-namer image
FROM ubuntu:12.10
MAINTAINER Brian Morearty, brian@morearty.org

RUN apt-get update
RUN apt-get install -y curl git build-essential ruby1.9.3
RUN gem install rubygems-update
RUN update_rubygems
RUN gem install bundler sinatra --no-ri --no-rdoc

# Sinatra uses this port
EXPOSE 9292

# Copy the app into the container
ADD namer /opt/namer
WORKDIR /opt/namer
RUN bundle install

CMD ["rackup"]
