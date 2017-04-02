# Requirements

The application in this repository simulates one of Credible's main flows, Borrower Prequalification. It consists of a form to collect basic Borrower and Loan information that generates a list of Loans that the Borrower is eligible for from the different Lenders on the platform.

It implements both the backend and frontend. For simplicity's sake, the backend is a monolithic Ruby on Rails app exposing a Restful + JSON API (without authentication). Frontend is a simple Backbone.js application served via Rails default asset pipeline and http server.

# Assignments

Unless specified, you are free to choose which of the assignments below to do. You can even do some of each if you would prefer. Also, the amount of time you spend doing this code exercise is completely up to you. All we ask is that you provide enough code to properly evaluate your skills.

Keep in mind that we want to evaluate both your final code quality and how organized you are. Because of that, we ask that you please commit changes to your assigned branch as you work through the exercise (don't do a single commit at the end with all the changes).

## Font End Assignments

Our main goal here is to evaluate your base CSS and Javascript skills. But besides that, we also consider how much you understand and how well you use the tools and frameworks you choose for development.

This repository provides a basic frontend experience using Backbone, Bootstrap, and default Rails assets pipeline that you can use as a start point, but feel free to use any other tools and frameworks you like. If you decide to use completely different tools, either create a new repository and share with us or put everything inside a directory in your branch.

There are [Postman](https://www.getpostman.com/) resources to interact with the API if you need: https://github.com/crediblelabs/credible-lite/tree/master/postman

Just import the environments and the collection, then select the environment before triggering the API call.

In addition to the assignments, feel free to surprise us with improvements in any of those areas:
- Styling of the elements on the page;
- How information is displayed and organized;
- How the user interacts with the page;
- Use of animations and transitions.

### Assignment 1 - Offers comparison

In the Results page, allow the user to select a set of the offers they have received, then display those offers in a way that allows them to compare the different offers attributes.

### Assignment 2 - Best Offers

In the Results page, ask the user what is the most important attribute for them:
- best APR
- shortest term
- lowest monthly payment

Then use that information to help the user visualize what is the best offer for him.

### Assignment 3 - "Better" Offers

In the Results page, suppose the user already have an Offer elsewhere. Ask him what the attributes of that Offer are and use that information to highlight in each of our Offers each attribute that is better than what he currently have.

### Assignment 4 - Offers Sorting and Filtering

In the Results page, allow users to sort and filter the list of Offers he received.

### Assignment 5 - Improve form experience

In the Form page, add frontend validation, input masking and address auto-completion.


## Back End Assignment

We chiefly want to evaluate your backend skills, but how it interacts with the front end is important, as well.

The baseline application uses only the entered income and credit_score to assess if a Submission is eligible for a given Product of a Lender (see Product model, eligible? method).

Your assignment is to add a new eligibility restriction based on the school the Borrower attended.

- Create the models to represent the School and its relationship with the Lender;
- Change the Submission model to reference the selected School;
- Seed the db/seeds/schools.csv into the database (no need to load every field; just the ones you think are important for the problem);
- Create a RESTful + JSON endpoint for the schools;
- Allow the user to select their school in the Submission form;
- Change Product.eligible? to match the selected School against the list of eligible Schools of a Lender;

Example of things that would be nice to have:
- Create unit and/or integrated tests for the parts of the backend code relevant to the assignment;
- Make the Schools endpoint accessible from different domains (CORS);
- On the Submission form, use a UI component that offers autocompletion;
- Improve the site UI/UX;

The list of eligible Schools of each Lender can be defined randomly (during School list seed for example, via a rake task, or any other way), but the relationship must be persisted in the database.

## I'm done with the coding challenge, now what?

When you are done, just send us back a zip file with the finished project with any additional information on how to run it. It is not required, but it would help us if you could deploy your project somewhere (we provide basic instructions on how to deploy it to Heroku).

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
