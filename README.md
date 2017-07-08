# PleasePet
[![Build Status](https://travis-ci.org/ineffyble/pleasepet.svg?branch=master)](https://travis-ci.org/ineffyble/pleasepet)

PleasePet is a web app for petting pets online. Originally hosted at https://please.pet, this project has been postponed due to developer capacity.

This project is in the process of being cleaned up, as it has been hastily redeveloped to cope with increased capacity.

### Technologies
* Ruby
* Rails
* Postgresql
* Sidekiq
* Bootstrap
* jQuery

### Contributing
Pull requests are very welcome and encouraged.

### Getting Started

#### Installing

Make sure you have Ruby and Rails set up beforehand.

Clone the git repo into your preferred location, and then from there run:
```
bundle install --without production
bundle exec rake db:migrate
```
This will set up the dependencies and the pet database. 

#### Running

To start the server, run `rails s` from the project directory.






 
