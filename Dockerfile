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


cmd ["/bin/bash", "--login"]
