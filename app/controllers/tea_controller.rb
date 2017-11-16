class TeaController < ApplicationController

  get '/users/:slug/teas' do
    if logged_in?
      @user = current_user
      erb :'/teas/index'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/teas/new' do
    if logged_in?
      @user = current_user
      @types = Type.all
      erb :'/teas/create_tea'
    else
      redirect '/login'
    end
  end

  post '/users/teas' do
    if params.values.any? {|value| value == ""}
     flash[:message] = "Please enter all fields."
     redirect "/users/#{current_user.slug}/teas/new"
   else
     user = current_user
     @tea = current_user.teas.build(params[:tea])
     @tea.type_ids = params[:type][:type_ids]
     if @tea.save
       flash[:message] = "New Tea added to crate!"
       redirect "/users/#{current_user.slug}/teas/#{@tea.id}"
     else
       redirect "/users/#{current_user.slug}/teas/new"
     end
   end
  end

  get '/users/:slug/teas/:id' do
    if logged_in?
      @user = current_user
      @tea = Tea.find(params[:id])
      erb :'/teas/show_tea'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/teas/:id/edit' do
    if logged_in?
      @user = current_user
      @tea = Tea.find(params[:id])
      @tea.user_id == session[:user_id]
        erb :'/teas/edit_tea'
    else
      redirect '/login'
    end
  end

  patch '/users/:slug/teas/:id' do
    if params.values.any? {|value| value == ""}
      flash[:message] = "Please enter all fields."
      redirect "/users/#{current_user.slug}/teas/#{@tea.id}/edit"
    else
      @user = current_user
      @tea = Tea.find(params[:id])
      # @tea = user.teas.find(params[:id])
      @tea.update(params[:tea])
      # binding.pry
      @tea.types = params[:type][:type_name]
      # @tea.type_ids = params[:type][:type_ids]
      # if !params[:type][:type_name].empty?

      #   @tea.types << Type.create(params[:type][:type_name])
      # end
      @tea.save
      flash[:message] = "Your Tea has been updated!"
      redirect "/users/#{current_user.slug}/teas/#{@tea.id}"
    end
  end

  delete '/users/:slug/teas/:id/delete' do
    if logged_in?
      @user = current_user
      @tea = Tea.find(params[:id])
      # @type = Type.find(params[:id])
      if @tea.user_id == session[:user_id]
        @tea.delete
        # @type.delete
        flash[:message] = "Your Tea has been removed from your crate!"
        redirect "/users/#{@user.slug}/teas"
      else
        redirect "/users/#{@user.slug}/teas"
      end
    else
      redirect '/login'
    end
  end


end
