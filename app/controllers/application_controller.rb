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
    erb :"/teas/index"
  end

  get '/signup' do
    erb :"/signup"
  end

  post '/signup' do
    # if !logged_in
    #   erb :'/signup'
    # else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect :"/teas/index"
    # end
  end

  get "/login" do
    erb :'/login'
  end

  get '/logout' do
    erb :'/logout'
  end


#--- helper methods ---
  def current_user
    User.find_by(session[:user_id])
  end

  def logged_in
    !!session[:user_id]
  end

end
