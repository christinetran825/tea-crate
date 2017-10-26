require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :"/index"
  end

  get "/signup" do
    erb :"/signup"
  end

  post '/signup' do
    @user = User.create(params)
    binding.pry
    redirect :"/users/account"
  end

  get '/users/account' do
    erb :"/users/account"
  end

  get "/login" do
    erb :'/login'
  end

  get '/logout' do
    erb :'/logout'
  end

end
