class TeaController < ApplicationController

  get '/teas' do
    if !logged_in
      redirect '/login'
    else
      erb :'/teas/index'
    end
  end

  get '/teas/new' do
    if !logged_in
      redirect '/login'
    else
      erb :'/teas/create_tea'
    end
  end


end
