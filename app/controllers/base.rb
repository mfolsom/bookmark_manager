require 'rack-flash'
require_relative '../helpers/application'

module Controllers
  class Base < Sinatra::Base
    register Sinatra::Partial
    set :partial_template_engine, :erb

    enable :sessions
    set :session_secret, 'carpe diem'
    
    use Rack::Flash
    use Rack::MethodOverride

    helpers UserHelper
    
    set :views, File.join(File.dirname(__FILE__), '../views')
  end
end