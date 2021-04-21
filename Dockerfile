FROM jrottenberg/ffmpeg:4.4-ubuntu

ARG NODE_VERSION=10.15.1
ARG DELETE_PACKAGES="curl python3 build-essential"

RUN apt-get update
RUN apt-get install $DELETE_PACKAGES libxi-dev libglu1-mesa-dev libglew-dev pkg-config xvfb -y --no-install-recommends

# install nodejs
RUN curl --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" > /tmp/node.tar.gz && \
  tar -xf /tmp/node.tar.gz -C /usr/local --strip-components=1 && \
  rm /tmp/node.tar.gz

RUN apt-get remove -y $DELETE_PACKAGES && rm -rf /var/lib/apt/lists/*

RUN npm config set user root && \
  npm install -g ffmpeg-concat

ENTRYPOINT ["xvfb-run", "-s", "-ac -screen 0 1280x1024x24"]