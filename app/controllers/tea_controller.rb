class TeaController < ApplicationController

  get '/users/:slug/teas' do
    @user = current_user
    @teas = Tea.all
    erb :'/teas/index'
  end

  get '/users/:slug/teas/new' do
    @user = current_user
    erb :'/teas/create_tea'
  end

  post '/users/:slug/teas' do
    if params.has_key?("")
      redirect "/users/#{@user.slug}/teas/new"
    else
      @user = current_user
      @tea = Tea.create
      @tea.tea_name = params[:tea][:tea_name]
      @tea.types << Type.create(params[:tea][:type])
      @tea.save
      redirect "/users/#{@user.slug}/teas/#{@tea.id}"
    end
  end

  get '/users/:slug/teas/:id' do
    @user = current_user
    @tea = Tea.find(params[:id])
    erb :'/teas/show_tea'
  end

  get '/users/:slug/teas/:id/edit' do
    @user = current_user
    @tea = Tea.find(params[:id])
    binding.pry
    erb :'/teas/edit_tea'
  end

  patch '/users/:slug/teas/:id' do
    @user = current_user
    @tea = Tea.find(params[:id])
    @tea.types.clear
    @tea.types << Type.create(params[:tea][:type])
    @tea.save
    redirect "/users/#{@user.slug}/teas/#{@tea.id}"
  end

  delete '/users/:slug/teas/:id' do
    @user = current_user
    @tea = Tea.find(params[:id])
    @tea.destroy
    redirect "/users/#{@user.slug}/teas"
  end


end
