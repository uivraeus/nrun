FROM node:16-buster-slim

#RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#    && apt-get -y install --no-install-recommends \
#        git

# Replace default npm version with the latest patch
COPY ./update-npm.sh /update-npm.sh
RUN ./update-npm.sh

# Match my host setup
USER 1000

CMD echo "My Node.js wrapper - node: $(node --version), npm: $(npm --version)"

