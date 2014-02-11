require 'sinatra'
require 'data_mapper'
require_relative 'bookmark_manager'



env = ENV["RACK_ENV"] || "development"
#we're telling datamapper to use a postgress database on localhost. 

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!


