# README

Here is my submission for the Pingsurance task.  In order to get started, clone down this repository and run ```bundle install``` to add in the dependencies from the Gemfile.  As per requirements, Twilio has been incorporated to send off welcome texts.

This application also uses Postgresql, so be sure to also run the commands to set up your database with ```rails db:create``` and ```rails db:migrate```.


# TWILIO Configuration

Twilio requires a unique Account SID and Auth Token in order to verify permissions for sending SMS from your Twilio Phone Number.  Currently, in my design, these 3 variables are all stored in a ```.env``` file and called upon within the Lead_controller during the Create method.  Be sure to create the following variables in your own ```.env``` file and populate them with your own information:

* TWILIO_ACCOUNT_SID

* TWILIO_AUTH_TOKEN

* TWILIO_PHONE_NUMBER

Once this step is completed, start up your Rails server ```rails s``` and navigate to http://localhost:3000/ to see the demo.
