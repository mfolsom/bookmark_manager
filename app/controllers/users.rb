
module Controllers
  class Users < Base
    get '/users/new' do
      @user = User.new
      erb :"users/new"
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

    get '/users/reset_password' do
      erb :"users/reset_password"
    end

    get '/users/reset_password/:token' do

    end

    post '/users/reset_password' do
      email = params[:email]
      user = User.check_email(email)
          if user
            flash[:notice] = "Your password has been sent!"
            redirect to('/users/reset_password/:token')
          else
            flash.now[:errors] = ["The email was not found"]
            erb :"sessions/new"
          end
      end
  end
end