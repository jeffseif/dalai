FROM python:3.10-slim-buster

RUN : \
    && apt-get update --yes --fix-missing \
    && apt-get install --yes \
        build-essential \
        curl \
        g++ \
        git \
        make \
        python3-venv \
        software-properties-common \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get update --yes --fix-missing \
    && apt-get install --yes \
        nodejs \
    && rm -rf /var/lib/apt/lists/* \
    && :

WORKDIR /root/dalai

# Install dalai and its dependencies
RUN : \
    && npm install dalai@0.3.1 \
    && npx dalai alpaca setup \
    && :

# The dalai server runs on port 3000
EXPOSE 3000

# Run the dalai server
CMD [ "npx", "dalai", "serve" ]

