[![Stories in Ready](https://badge.waffle.io/settai/uozumi.png?label=ready&title=Ready)](https://waffle.io/settai/uozumi)
# uozumi

## Getting Started (docker)

1. Install docker and docker-compose

2. Clone uozumi

        git clone https://github.com/settai/uozumi

3. Create database.yml

        cd uozumi
        cp config/database.yml{.sample,}

4. Create and start containers

        docker-compose up

5. Install gems

        docker_bin/bundle install

6. Boot servers

        docker_bin/rails s -b 0.0.0.0

7. Setup db

        docker_bin/rake db:setup
