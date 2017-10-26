class TeaController < ApplicationController

  get '/teas' do
    if !logged_in
      redirect "/login"
    else
      @teas = Tea.all
      erb :'/teas/index'
    end
  end

  get '/teas/new' do
    if !logged_in
      redirect "/login"
    else
      erb :'/teas/create_tea'
    end
  end

  post '/teas' do
    if params.has_any?("")
      redirect "/teas/new"
    else
      @tea = Tea.create(params)
      redirect "/teas/#{{@tea.id}}"
    end
  end

  get '/teas/:id' do
    @tea = Tea.find_by(params[:id])
    erb :'/teas/show_tea'
  end

  get '/teas/:id/edit' do
    @tea = Tea.find_by(params[:id])
    erb :'/teas/edit_tea'
  end

  patch '/teas/:id' do
    @tea = Tea.find_by(params[:id])
    @tea.type = params[:type]
    @tea.save
    redirect "/teas/#{@tea.id}"
  end

  delete '/teas/:id' do
    @tea = Tea.find_by(params[:id]
    @tea.delete
    redirect "/teas"
  end

end
