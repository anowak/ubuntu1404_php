from shippableimages/ubuntu1204_base:0.0.3
maintainer ragesh@shippable.com

# Install php dependencies

run apt-get update && apt-get -y --force-yes install \
    autoconf \
    build-essential \
    curl \
    freetds-dev \
    git \
    libXpm-dev \
    libaspell-dev \
    libbz2-dev \
    libc-client-dev \
    libcurl3-dev \
    libdb5.1-dev \
    libfreetype6-dev \
    libgmp3-dev \
    libjpeg-dev \
    libldap2-dev \
    libmcrypt-dev \
    libmhash-dev \
    libmysqlclient15-dev \
    libpcre3-dev \
    libpng-dev \
    libreadline6-dev \
    librecode-dev \
    libsnmp-dev \
    libsqlite-dev \
    libssl-dev \
    libt1-dev \
    libtidy-dev \
    libxml2-dev \
    libxslt-dev \
    libz-dev \
    ncurses-dev \
    software-properties-common \
    unzip \
    wget;


# Install phpenv
run cd /tmp && \
    git clone https://github.com/CHH/phpenv.git && \
    cd phpenv/bin && \
    ./phpenv-install.sh && \
    cp -r /tmp/phpenv/extensions $HOME/.phpenv/extensions && \
    rm -rf /tmp/phpenv

# Install php-build

run git clone https://github.com/CHH/php-build.git /opt/php2build --depth 1
run /opt/php2build/install.sh


# Install PHP 5.3
run php-build -i development 5.3.29 $HOME/.phpenv/versions/5.3

# Install PHP 5.4
run php-build -i development 5.4.33 $HOME/.phpenv/versions/5.4

# Install PHP 5.5
run php-build -i development 5.5.17 $HOME/.phpenv/versions/5.5

# Install PHP 5.6
run php-build -i development 5.6.1 $HOME/.phpenv/versions/5.6

env PATH /root/.phpenv/bin:/root/.phpenv/extensions:$PATH
run echo 'eval "$(phpenv init -)"' | tee -a /root/.bashrc
run eval "$(phpenv init -)" && \
    phpenv global 5.6

run export PATH="/root/.phpenv/bin:$PATH" && eval "$(phpenv init -)" && \
    curl -sS https://getcomposer.org/installer | php && \

mv composer.phar /usr/local/bin/composer && \

echo "==================== Installing phpenv composer plugin ===================" && \
mkdir /root/.phpenv/plugins && cd /root/.phpenv/plugins && \
git clone https://github.com/ngyuki/phpenv-composer.git && \
phpenv rehash


run export PATH="/root/.phpenv/bin:$PATH" && eval "$(phpenv init -)" && \
    echo "==================== Installing composer in PHP 5.3 ===================" && \ 
    phpenv global 5.3 && \
    phpenv rehash && \

    composer --version && \

    echo "==================== Installing phpunit in PHP 5.3 ===================" && \
    wget https://phar.phpunit.de/phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /root/.phpenv/versions/5.3/bin/phpunit && \
    phpenv rehash

run export PATH="/root/.phpenv/bin:$PATH" && eval "$(phpenv init -)" && \
    echo "==================== Installing composer in PHP 5.4 ===================" && \ 
    phpenv global 5.4 && \
    phpenv rehash && \

    composer --version && \

    echo "==================== Installing phpunit in PHP 5.4 ===================" && \
    wget https://phar.phpunit.de/phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /root/.phpenv/versions/5.4/bin/phpunit && \
    phpenv rehash

run export PATH="/root/.phpenv/bin:$PATH" && eval "$(phpenv init -)" && \
    echo "==================== Installing composer in PHP 5.5 ===================" && \ 
    phpenv global 5.5 && \
    phpenv rehash && \

    composer --version && \

    echo "==================== Installing phpunit in PHP 5.5 ===================" && \
    wget https://phar.phpunit.de/phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /root/.phpenv/versions/5.5/bin/phpunit && \
    phpenv rehash

run export PATH="/root/.phpenv/bin:$PATH" && eval "$(phpenv init -)" && \
    echo "==================== Installing composer in PHP 5.6 ===================" && \ 
    phpenv global 5.6 && \
    phpenv rehash && \

    composer --version && \
    
    echo "==================== Installing phpunit in PHP 5.6 ===================" && \
    wget https://phar.phpunit.de/phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /root/.phpenv/versions/5.6/bin/phpunit && \
    phpenv rehash

cmd ["/bin/bash", "--login"]
