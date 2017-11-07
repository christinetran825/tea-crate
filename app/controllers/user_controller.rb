class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect "/users/#{@user.slug}"
    end
  end

  post '/signup' do
    if params.has_value?("")
      redirect "/signup"
    else
      @user = User.new
      @user.username = params[:username]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.save
      session[:user_id] = @user.id
      flash[:message] = "Signup complete!"
      redirect "/users/#{@user.slug}"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect "/users/#{@user.slug}"
    end
  end

  post '/login' do
    @user = User.find_by_slug(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    if !logged_in?
      redirect "/"
    else
      session.clear
      redirect "/login"
    end
  end

  get '/users/:slug' do
    @user = User.find_by(username: params[:slug])
    erb :'/users/show'
  end

end
