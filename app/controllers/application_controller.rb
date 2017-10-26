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

  get '/registrations/signup' do
    if !logged_in
      erb :'/registrations/signup'
    else
      redirect "/teas"
    end
  end

  post '/signup' do
    if params.has_value?("")
      redirect "/registrations/signup"
    else
      @user = User.new
      @user.name = params[:name]
      @user.email = params[:email]
      @user.password_digest = params[:password]
      @user.save
      session[:user_id] = @user.id
      redirect "/teas"
    end
  end

  get '/login' do
    if !logged_in
      erb :'/login'
    else
      redirect '/teas'
    end
  end

  post '/login' do
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/teas"
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

  get '/users/show' do
    @user = User.find(session[:id])
    erb :'/users/show'
  end


#--- helper methods ---
  def current_user
    User.find_by(session[:user_id])
  end

  def logged_in
    !!session[:user_id]
  end

end
