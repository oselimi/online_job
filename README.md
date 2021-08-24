# Online JOb

### About us

Online job app, is designed to make it easy for you to apply to your favorite job quickly and efficiently.

### Developing

###### Build With

Online Job is created as following including(frameworks and library):
 * Ruby 2.7.2
 * Rails 6.1.4
 * Bootstrap
 * HTML

 if you don't have install Ruby or Rails please follow link:
  [Install Ruby on Rails](https://gorails.com/setup/osx/10.15-catalina)

 ###### Test

 RSpec and Capybara is laguages who is used in this project.
 FactoryBot, Shoulda-matcher and Guard are extra gems we used in project.

###### Setting up Dev

Here is a brief intro about what a developer must do in order to start developing the project further: 

git clone [GitHub](https://github.com/oselimi/online_job)
cd online_job/

###### Database
 In this app we are using is Postgresql developer must do create database and migrate as following:
  rails db:create
  rails db:migrate
  rails db:seed

###### Building
 After migrate database you must do installing all gem files and yarn:
  bundle install
  yarn install

###### Server
 If everything is well, then start server:
  rails server

