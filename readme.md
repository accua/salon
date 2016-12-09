# _Hair Salon_

#### _This application allows the user to view, add, update and delete stylists and clients. It also allows clients to be added to stylists., 12/09/2016_

#### By _**Andrew Accuardi**_

## Specifications

_This webapp is called "Hair Salon". The purpose of this application is to showcase my Ruby abilities up to this point in week 3 of the Ruby track at Epicodus.

# _User Stories_

* _As a salon owner, I can view, add, update and delete stylists._
* _As a salon owner, I can view, add, update and delete clients._
* _As a salon owner, I can add clients to a stylist._

## Setup/Installation Requirements

### How to install locally:
* _Clone the repository down._
* _Find the directory in terminal._
* _Run the command "bundle install" to install the required gems._
* _Run the command "postgres" to instantiate the database software._
* _Run the command "psql" in a new tab in terminal._
* _Run these commands in terminal:
    _CREATE DATABASE hair_salon;_
    _\c hair_salon_
    _CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);_
    _CREATE TABLE clients (id serial PRIMARY KEY, name varchar, id_stylist int);_
    _CREATE TABLE hair_salon_test WITH TEMPLATE hair_salon;_
* _Run the command "ruby app.rb" to host the app on sinatra._
* _Access localhost:4567 in your web browser, and the app should appear._

### OR
* _[Go here](https://ancient-bayou-47703.herokuapp.com/)_

## Technologies Used

_This webapp uses Ruby, Sinatra, materialize CSS, HTML5_

### License

Copyright (c) 2016 **_Andrew Accuardi_**

This code is licensed under the MIT license.
