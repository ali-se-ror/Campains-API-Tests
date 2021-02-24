# README

    Update database.yml
    bundle install
    rails db:create
    rails db:migrate
# Postman file is located in project
    export the file to postman
    call create users api /users endpoint to create user
    call /login api to login into application
    call other endpoints with token received in login request
    user Header Authorization to send token
# Tests
    Application only contains the controller testcases
    run "rails test" to run entire tests