require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "password_security"
  end

  get '/' do
    erb :'/index'
  end

  get '/users/signup' do
    if !logged_in
      erb :'/registrations/signup'
    else
      # redirect "/teas"
      redirect "/users/#{@user.id}/teas"
    end
  end

  post '/signup' do
    if params.has_value?("")
      redirect "/users/signup"
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
      erb :'/login'
    else
      redirect "/users/#{@user.id}/teas"
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

  get '/teas/tea-info/history-tea' do
    erb :'/tea-info/history_tea'
  end

  get '/teas/tea-info/art-of-tea' do
    erb :'/tea-info/art_of_tea'
  end

  get '/teas/tea-info/tea-customs' do
    erb :'/tea-info/tea_customs'
  end

  get '/teas/tea-info/tea-etiquette' do
    erb :'/tea-info/tea_etiquette'
  end

  get '/teas/tea-info/tea-resources' do
    erb :'/tea-info/tea_resources'
  end

#--- helper methods ---
  def current_user
    User.find_by(session[:user_id])
  end

  def logged_in
    !!session[:user_id]
  end

end
