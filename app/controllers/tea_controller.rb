class TeaController < ApplicationController

  get '/users/:slug/teas' do
    if !logged_in?
      redirect '/login'
    else
      @user = current_user
      # session[:user_id] = @user.id
      @teas = @user.teas
      # binding.pry
      erb :'/teas/index'
    end
  end

  get '/users/:slug/teas/new' do
    if !logged_in?
      redirect '/login'
    else
      @user = current_user
      @types = Type.all
      erb :'/teas/create_tea'
    end
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
      flash[:message] = "New Tea added to crate!"
      redirect "/users/#{@user.slug}/teas/#{@tea.id}"
    end
  end

  get '/users/:slug/teas/:id' do
    if !logged_in?
      redirect '/login'
    else
      @user = current_user
      @tea = Tea.find(params[:id])
      # @message = session[:message]
      # session[:message] = nil
      erb :'/teas/show_tea'
    end
  end

  get '/users/:slug/teas/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      @user = current_user
      @tea = Tea.find(params[:id])
      erb :'/teas/edit_tea'
    end
  end

  patch '/users/:slug/teas/:id' do
    @user = current_user
    @tea = Tea.find(params[:id])
    @tea.tea_name = params[:tea][:tea_name]
    @tea.types.clear
    @tea.types << Type.create(params[:tea][:type])
    @tea.save
    flash[:message] = "Your Tea has been updated!"
    redirect "/users/#{@user.slug}/teas/#{@tea.id}"
  end

  delete '/users/:slug/teas/:id/delete' do
    if !logged_in?
      redirect '/login'
    else
      @user = current_user
      @tea = Tea.find(params[:id])
      @tea.delete
      flash[:message] = "Your Tea has been removed from your crate!"
      redirect "/users/#{@user.slug}/teas"
    end
  end


end
