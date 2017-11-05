class TeaController < ApplicationController

  get '/users/:slug/teas' do
    @user = current_user
    @teas = Tea.all
    @types = Type.all
    # binding.pry
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

  get '/users/:slug/teas/:tea_id' do
    @user = current_user
    @tea = Tea.find(params[:tea_id])
    # binding.pry
    erb :'/teas/show_tea'
  end

  get '/users/:slug/teas/:tea_id/edit' do
    @user = current_user
    # binding.pry
    @tea = Tea.find(params[:tea_id])
    erb :'/teas/edit_tea'
  end

  post '/users/:slug/teas/:tea_id' do
    @user = current_user
    @tea = Tea.find(params[:tea_id])
    @tea.types.update(params[:tea][:type])
    @tea.save
    # binding.pry
    redirect "/users/#{@user.slug}/teas/#{@tea.id}"
  end

  delete '/users/:slug/teas/:tea_id' do
    @user = current_user
    @tea = Tea.find(params[:tea_id])
    @tea.destroy
    redirect "/users/:slug/teas"
  end


end
