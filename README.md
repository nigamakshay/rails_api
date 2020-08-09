
This project shows API along with RAILS web application
Ruby also gives an option to have API-only application, read more at - https://guides.rubyonrails.org/api_app.html

Includes usage of -
 * API for CRUD operations
 * SQLite database
 * Model level validation
 * API response with status codes and messages
 

For reference -
 * Create project
    command - rails new rails_api

 * Create user model 
    command - rails g model User first_name last_name age email password:digest

 * Create user controller 
    command - rails g controller User

 * Migrate db 
    command- rake db:migrate

 * Add resources in route.rb

 * Check routes created
    command - rake routes
 
 * disable CSRF protection, when API request doesn't have HTML form
    add in ApplicationController - protect_from_forgery with: :null_session
