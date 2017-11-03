class TeaController < ApplicationController

  get '/users/:id/teas' do
    @user = current_user
    @teas = Tea.all
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
      binding.pry
      @teas = Tea.new
      @teas.tea_name = params[:tea][:tea_name]
      @teas.brand = params[:tea][:brand]
      @teas.types = params[:tea][:types][:type_name]
      @teas.tea_name = params[:tea][:tea_name]
      @teas.tea_name = params[:tea][:tea_name]
      @teas.tea_name = params[:tea][:tea_name]
      @teas.save
      @types = Type.all

      redirect "/users/#{@user.id}/teas/#{@tea.id}"
    end
  end

  get '/users/:id/teas/:tea_id' do
    @user = current_user
    @tea = Tea.find_by(params[:id])
    erb :'/teas/show_tea'
  end

  #
  # get '/users/:id/teas/:id/edit' do
  #   @tea = Tea.find_by(params[:id])
  #   erb :'/teas/edit_tea'
  # end
  #
  # patch '/users/:id/teas/:id' do
  #   @tea = Tea.find_by(params[:id])
  #   @tea.type = params[:type]
  #   @tea.save
  #   redirect "/users/#{@user.id}/teas/#{@tea.id}"
  # end
  #
  # delete '/users/:id/teas/:id' do
  #   @tea = Tea.find_by(params[:id])
  #   @tea.delete
  #   redirect "/users/:id/teas"
  # end


end
