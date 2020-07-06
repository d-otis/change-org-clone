# Change.org Clone

## Installation

1. clone this repo onto your machine
1. run ```bundle exec install``` to download/install dependencies
1. change any environment variables in your deployment environmont or from your own ```.env``` file that you create in the root folder
1. ```rails db:migrate``` to create your SQLite db
1. I've provided some seed data in ```seeds.rb```, but feel free to change this to make it your own: run ```rails db:seed``` to seed DB from said file
1. start server with ```rails s``` or ```rails s --binding=0.0.0.0``` to access app from another device on your local network

## To Do
- add tests
