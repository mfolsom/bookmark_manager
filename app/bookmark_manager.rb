require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'

require_relative 'controllers/base'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base

  Dir.glob(File.join(File.dirname(__FILE__), 'controllers', '*.rb'),&method(:require))

  use Controllers::Links
  use Controllers::Users
  use Controllers::Auth

  # start the server if ruby file executed directly
  run! if app_file == $0
end
