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
      @types = Type.all
      # binding.pry
      erb :'/teas/create_tea'
    # end
  end

  post '/users/:id/teas' do
    if params.has_any?("")
      redirect "/users/:id/teas/new"
    else
      @type = Type.new
      @type.name = params[:name]
      @type.brand = params[:brand]
      @type.origin = params[:origin]
      @type.leaves = params[:leaves]
      @type.caffeine = params[:caffeine]
      @type.pairings = params[:pairings]
      @type.brew_time = params[:brew_time]
      @type.tasting_notes = params[:tasting_notes]
      @type.comments = params[:comments]
      @type.save
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
