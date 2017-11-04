class TeaController < ApplicationController

  get '/users/:id/teas' do
    @user = current_user
    @teas = Tea.all
    @types = Type.all
    # binding.pry
    erb :'/teas/index'
  end

  get '/users/:id/teas/new' do
    @user = current_user
    erb :'/teas/create_tea'
  end

  post '/users/:id/teas' do
    if params.has_key?("")
      redirect "/users/#{@user.id}/teas/new"
    else
      @user = current_user
      @tea = Tea.create
      @tea.tea_name = params[:tea][:tea_name]
      @tea.types << Type.create(params[:tea][:type])
      @tea.save
      redirect "/users/#{@user.id}/teas/#{@tea.id}"
    end
  end

  get '/users/:id/teas/:tea_id' do
    @user = current_user
    @tea.id = Tea.find(params[:tea_id])
    # binding.pry
    @type = Type.find(params[:tea_id])
    erb :'/teas/show_tea'
  end

  get '/users/:id/teas/:tea_id/edit' do
    @user = current_user
    binding.pry
    @tea.id = Tea.find(params[:tea_id])
    @type = Type.find(params[:tea_id])
    erb :'/teas/edit_tea'
  end

  post '/users/:id/teas/:tea_id' do
    @user = current_user
    @tea = Tea.find(params[:tea_id])
    @type = Type.find(params[:tea_id])
    @tea.types.update(params[:tea][:type])
    @tea.save
    redirect "/users/#{@user.id}/teas/#{@tea.id}"
  end

  delete '/users/:id/teas/:tea_id' do
    @user = current_user
    @tea = Tea.find(params[:tea_id])
    @tea.destroy
    redirect "/users/:id/teas"
  end


end
