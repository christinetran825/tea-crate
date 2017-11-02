class UserController < ApplicationController

  get '/signup' do
    if !logged_in
      erb :'/users/signup'
    else
      redirect "/users/#{@user.id}"
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
      redirect "/users/#{@user.id}"
    end
  end

  get '/login' do
    if !logged_in
      erb :'/users/login'
    else
      redirect "/users/#{@user.id}"
    end
  end

  post '/login' do
    @user = User.find_by_slug(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    if !logged_in
      redirect "/"
    else
      session.clear
      redirect "/login"
    end
  end

  get '/users/:id' do
    @user = User.find_by(session[:user_id])
    erb :'/users/show'
  end

end