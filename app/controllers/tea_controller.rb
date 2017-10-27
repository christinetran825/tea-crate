class TeaController < ApplicationController

  get '/users/:id/teas' do
    # binding.pry
    # if !logged_in
    #   redirect "/login"
    # else
      # @user = current_user
      @user = User.find_by(session[:user_id])
      @teas = Tea.all
      erb :'/teas/index'
    # end
  end

  get '/users/:id/teas/new' do
    # if !logged_in
    #   redirect "/login"
    # else
      erb :'/teas/create_tea'
    # end
  end

  post '/users/:id/teas/new' do
    if params.has_any?("")
      redirect "/users/:id/teas/new"
    else
      @tea = Tea.create(params)
      redirect "/users/#{@user.id}/teas/#{@tea.id}"
    end
  end

  # get '/users/:id/teas/:id' do
  #   @tea = Tea.find_by(params[:id])
  #   erb :'/teas/show_tea'
  # end
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
