ubuntu1404_php
==============


Shippable CI image for PHP on Ubuntu 14.04. Available php versions:

1. 5.3
2. 5.4
3. 5.5
4. 5.6

## How to use
You can use this image to run php builds on Shippable. Add build_image tag to your shippable.yml file and activate the required version in before_install section to run your build against the correct version of php. The php versions you specify in the `php`
directive in the YML will be available in the `$SHIPPABLE_PHP_VERSION` environment
variable. Here's a sample YML file to get you going:

````
language: php

php:
  - 5.3
 
build_image: shippableimages/ubuntu1404_php

before_install:
  # Activate the required php version
  - export PATH=$HOME/.phpenv/bin:$HOME/.phpenv/extensions:$PATH && eval "$(phpenv init -)"
  - phpenv global $SHIPPABLE_PHP_VERSION
  - php --version

script:
  - phpunit tests/unittest.php

````
