require 'sinatra/base'

class BookmarkManager < Sinatra::Base
set :views, File.join(File.dirname(__FILE__), '../views')
  get '/' do
    erb :index
  end

  post '/' do
    params[:new_link]
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
