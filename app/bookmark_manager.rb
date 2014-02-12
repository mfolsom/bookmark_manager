require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'
require 'rack-flash'
require_relative '../lib/link'
require_relative '../lib/tag'
require_relative '../lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
  register Sinatra::Partial
  enable :sessions
  set :session_secret, 'carpe diem'
  use Rack::Flash
  set :partial_template_engine, :erb
  use Rack::MethodOverride
  helpers UserHelper

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/links' do
    url = params["url"]
    title = params["title"]
    tags = params["tags"].split(" ").map do |tag|
    Tag.first_or_create(:text => tag)
    end
    Link.create(:url => url, :title => title, :tags => tags)
    redirect to('/')
  end

  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = tag ? tag.links : []
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end


post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash.now[:errors] = ["The email or password are incorrect"]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  flash[:notice] ="Good bye!" 
  session[:user_id] = nil
  redirect to('/')
end

  post '/users' do
    @user = User.create(:email => params[:email],
                :password => params[:password],
                :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
