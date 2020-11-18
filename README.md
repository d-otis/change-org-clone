# Change.org Clone

[Live Demo](https://change-clone-demo.herokuapp.com)

## Overview
Inspired by the present moment I chose to model my domain on popular petition websites like Change.org and MoveOn.org

A user can join manually via the form or through an OAuth strategy via Facebook.

From onboarding they can create petitions and sign the authored_petitions of other users. Signatures act as joins between users and petitions with extra fields of a message and boolean that determines whether your name and message are displayed in association with a petition that you’ve signed.

## Built With
- Ruby on Rails (RESTful routes)
- PostgreSQL
- [Facebook OmniAuth Gem](https://github.com/simi/omniauth-facebook)

## Installation

1. clone this repo onto your machine
1. run ```bundle exec install``` to download/install dependencies
1. change any environment variables in your deployment environmont or from your own ```.env``` file that you create in the root folder (in particular any environment variables having to do with Facebook OAuth)
1. ```rails db:create && rails db:migrate``` to create and set up your PostgreSQL schema
1. I've provided some seed data in ```seeds.rb```, but feel free to change this to make it your own: run ```rails db:seed``` to seed DB from said file
1. start server with ```rails s``` or ```rails s --binding=0.0.0.0``` to access app from another device on your local network

## To Do
- add more tests
