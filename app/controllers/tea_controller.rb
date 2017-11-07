class TeaController < ApplicationController

  get '/users/:slug/teas' do
    # if !logged_in?
    #   redirect '/login'
    # else
      @user = current_user
      @teas = Tea.all
      erb :'/teas/index'
    # end
  end

  get '/users/:slug/teas/new' do
    # if !logged_in?
    #   redirect '/login'
    # else
      @user = current_user
      erb :'/teas/create_tea'
    # end
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
    # if !logged_in?
    #   redirect '/login'
    # else
      @user = current_user
      @tea = Tea.find(params[:id])
      @message = session[:message]
      session[:message] = nil
      erb :'/teas/show_tea'
    # end
  end

  get '/users/:slug/teas/:id/edit' do
    @user = current_user
    @tea = Tea.find(params[:id])
    erb :'/teas/edit_tea'
    # if !logged_in?
    #   redirect '/login'
    # else
    #   @user = current_user
    #   @tea = Tea.find(params[:id])
    #   if @tea.user_id == current_user.id
    #     erb :'/teas/edit_tea'
    #   else
    #     redirect :'/teas'
    #   end
    # end
  end

  patch '/users/:slug/teas/:id' do
    @user = current_user
    @tea = Tea.find(params[:id])
    @tea.types.clear
    @tea.types << Type.create(params[:tea][:type])
    @tea.save
    flash[:message] = "Your Tea has been updated!"
    redirect "/users/#{@user.slug}/teas/#{@tea.id}"
  end

  delete '/users/:slug/teas/:id' do
    # if !logged_in?
    #   redirect '/login'
    # else
      @user = current_user
      @tea = Tea.find(params[:id])
      @tea.delete
      redirect "/users/#{@user.slug}/teas"
    # end
  end


end
