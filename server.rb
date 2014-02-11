require 'sinatra'
require 'data_mapper'

env = ENV["RACK_ENV"] || "development"
#we're telling datamapper to use a postgress database on localhost. 

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link'

DataMapper.finalize

DataMapper.auto_upgrade!