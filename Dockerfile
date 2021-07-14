FROM node:16

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/app

COPY package*.json ./
    
RUN npm install

COPY src src

WORKDIR /usr/app/src

CMD [ "node", "server.js" ]
