class TeaController < ApplicationController

  get '/users/:id/teas' do
    # binding.pry
    # if !logged_in
    #   redirect "/login"
    # else
      @user = current_user
      # @user = User.find_by(session[:user_id])
      @teas = Tea.all
      erb :'/teas/index'
    # end
  end

  get '/users/:id/teas/new' do
    # if !logged_in
    #   redirect "/login"
    # else
      @user = current_user
      @types = Type.all
      erb :'/teas/create_tea'
    # end
  end

  get '/users/:id/teas/:tea_id' do
    @tea = Tea.find_by(params[:id])
    erb :'/teas/show_tea'
  end

  post '/users/:id/teas' do
    if params.has_key?("")
      redirect "/users/#{@user.id}/teas/new"
    else
      @user = User.find_by(session[:user_id])
      # binding.pry
      @types = Type.new
      # @tea = Tea.create(name: params[:tea][:name], type: params[:tea][:type])
      # params[:tea][:type].each do |tea_data|
      #   type = Type.new(tea_data)
      #   type.tea = tea
      #   type.save
      # end
      # @types.type = params[:type_name]
      @types.brand = params[:tea][:type][:brand]
      redirect "/users/#{@user.id}/teas/#{@tea.id}"
    end
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
