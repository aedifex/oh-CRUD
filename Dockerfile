# Using the newer version of PostgreSQL
FROM postgres:16.2

# Combine update and package installation steps to reduce layers and clean up in the same layer to reduce image size
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=docker \
    POSTGRES_PASSWORD=docker \
    POSTGRES_DB=docker

COPY package*.json ./
COPY index.js ./index.js
COPY queries.js ./queries.js



RUN npm install
RUN npm i express pg body-parser

ADD CreateDB.sql /docker-entrypoint-initdb.d/

CMD ["node", "index.js"]