require 'sinatra'
require 'data_mapper'
require_relative 'bookmark_manager'



env = ENV["RACK_ENV"] || "development"
#we're telling datamapper to use a postgress database on localhost. 

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

Dir.glob(File.join(File.dirname(__FILE__), 'models', '*.rb'), &method(:require))

DataMapper.finalize
DataMapper.auto_upgrade!


