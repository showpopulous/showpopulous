FROM ubuntu:22.04

# Set the timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set the work directory /app copy source code to /app
WORKDIR /app

COPY . /app

# Install required packages
RUN apt-get update && \
    apt-get install -y curl git unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js and Yarn
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install PHP and Composer
RUN apt-get update && \
    apt-get install -y php php-cli php-zip php-mbstring php-dom php-xml composer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN composer update

RUN yarn install

RUN cp /app/.env.example /app/.env

#CMD ["/bin/bash"]
CMD ["yarn", "dev"]
