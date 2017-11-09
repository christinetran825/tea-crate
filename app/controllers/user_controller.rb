class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      flash[:message] = "You're logged in. Here are your teas."
      redirect "/users/#{@user.slug}"
    end
  end

  post '/signup' do
    if logged_in?
      flash[:message] = "You're logged in. Here are your teas."
      redirect "/users/#{@user.slug}"
    elsif params.has_value?("")
      flash[:message] = "You must create both a username and password, and enter your email."
      redirect "/signup"
    else
      @user = User.create
      @user.username = params[:username]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      flash[:message] = "You're logged in. Here are your teas."
      redirect "/users/#{@user.slug}"
    end
  end

  post '/login' do
    @user = User.find_by_slug(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "Username and/or Password is incorrect! Try again."
      redirect "/login"
    end
  end

  get '/logout' do
    if !logged_in?
      redirect "/"
    else
      session.clear
      flash[:message] = "You have been logged out of your account."
      redirect "/login"
    end
  end

  get '/users/:slug' do
    @user = User.find_by(username: params[:slug])
    erb :'/users/show'
  end

end
