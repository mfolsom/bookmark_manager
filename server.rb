require 'sinatra'
require 'data_mapper'
require_relative 'lib/bookmark_manager'



env = ENV["RACK_ENV"] || "development"
#we're telling datamapper to use a postgress database on localhost. 

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'
require './lib/tag'

DataMapper.finalize

DataMapper.auto_upgrade!


