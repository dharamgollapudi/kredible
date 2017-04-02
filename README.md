# Readme

Kredible simulates Borrower Prequalification. It consists of a form to collect basic Borrower and Loan information that generates a list of Loans that the Borrower is eligible for from the different Lenders on the platform.

It implements both the backend and frontend. Backend is Ruby on Rails app exposing a Restful + JSON API (without authentication). Frontend is a simple Backbone.js application served via Rails default asset pipeline and http server.

## Back End Assignment

The baseline application uses only the entered income and credit_score to assess if a Submission is eligible for a given Product of a Lender (see Product model, eligible? method).

Your assignment is to add a new eligibility restriction based on the school the Borrower attended.

[x] Create the models to represent the School and its relationship with the Lender;
[x] Change the Submission model to reference the selected School;
[x] Seed the db/seeds/schools.csv into the database (no need to load every field; just the ones you think are important for the problem);
[x] Create a RESTful + JSON endpoint for the schools;
[x] Allow the user to select their school in the Submission form;
[x] Change Product.eligible? to match the selected School against the list of eligible Schools of a Lender;

Example of things that would be nice to have:
[x] Create unit and/or integrated tests for the parts of the backend code relevant to the assignment;
[x] Make the Schools endpoint accessible from different domains (CORS);
[x] On the Submission form, use a UI component that offers autocompletion;
- Improve the site UI/UX;

The list of eligible Schools of each Lender can be defined randomly (during School list seed for example, via a rake task, or any other way), but the relationship must be persisted in the database.

## Requirements

- ruby 2.3.0
- bundler
- rails 5.0.0.1
- postgresql

### Setup

- clone this project
- ```bin/bundle install```
- ```bin/rake db:setup``` (or db:create, db:migrate, db:seed)
- ```bin/rails s```
- http://localhost:3000

### Making a Submission

In order to get results on the Dashboard, just use appropriate values for Yearly Income, Credit Score and Loan Amount, like the following examples:

- Yearly Income: 130000
- Credit Score: 800
- Loan Amount: 30000

### Heroku deployment

Requires heroku toolbelt to be installed and configured.

- ```heroku create <appname>```
- ```git push heroku```
- ```heroku run rake db:migrate```
- ```heroku run rake db:seed```
- ```heroku open```

Deployed at `https://kredible-backend.herokuapp.com/`

### Testing

- ```git clone https://github.com/dharamgollapudi/kredible.git```
- ```cd kredible```
- ```bundle install```
- ```bundle exec rake db:create db:migrate db:test:prepare```
- ```bundle exec rake spec```
