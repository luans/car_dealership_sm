# Car Dealership SM

Is a management software that help you to control and manage your Car Dealership business.

# Run

To build using [docker-compose](https://docs.docker.com/compose/):

    % docker-compose build
    % docker-compose run web rake db:create
    % docker-compose run web rake db:migrate

And to start:

    % docker-compose up

To run the tests:

    % docker-compose run web rspec

Go to [localhost:3000](http://localhost:3000/).
