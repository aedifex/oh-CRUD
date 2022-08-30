FROM postgres:14.5

RUN apt update
RUN yes | apt install nodejs
RUN yes | apt install npm

ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB docker

COPY package*.json ./
COPY index.js ./index.js
COPY queries.js ./queries.js



RUN npm install
RUN npm i express pg body-parser

ADD CreateDB.sql /docker-entrypoint-initdb.d/

CMD ["node", "index.js"]