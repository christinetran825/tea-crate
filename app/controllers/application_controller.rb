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
