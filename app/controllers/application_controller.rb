require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "password_security"
  end

  get '/' do
    erb :"/index"
  end

  get '/teas' do
    if !logged_in
      redirect '/login'
    else
      erb :'/teas/index'
    end
  end

  # get '/teas/index' do
  #   erb :"/teas/index"
  # end

  get '/signup' do
    if !logged_in
      erb :'/signup'
    else
      redirect "/teas"
    end
  end

  post '/signup' do
    if params.has_value?("")
      redirect "/signup"
    else
      @user = User.new
      @user.name = params[:name]
      @user.email = params[:email]
      @user.password_digest = params[:password]
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


#--- helper methods ---
  def current_user
    User.find_by(session[:user_id])
  end

  def logged_in
    !!session[:user_id]
  end

end
