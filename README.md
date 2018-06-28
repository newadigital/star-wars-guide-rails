# Another Star Wars Guide - Ruby On Rails

A Star Wars Guide site using Ruby On Rails and the [The Star Wars API](https://swapi.co/documentation).

## Dependencies

* [Docker](https://docs.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Running Locally

The [local site](http://localhost:3000) is hosted on port :3000

[Local API](http://localhost:3000/api)

### Starting

First run requires the db setup:

`docker-compose run web rake db:create`

`docker-compose up`

### Stopping

`docker-compose down`

### Rebuilding

If you make changes to the Gemfile or the Compose file you need to rebuild. 
Some changes require only a docker-compose build, but a full rebuild requires a bundle install and docker-compose build to sync changes in the Gemfile.lock to the host:

`docker-compose run web bundle install`

`docker-compose up --build`

## Tests

[TODO]
