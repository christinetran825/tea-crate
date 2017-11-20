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
      if !params[:type][:type_name].blank? && @tea.types.nil? #creating the first type by creating its params as type_name
        @tea.types.new(type_name: params[:type][:type_name])
      elsif !params[:type][:type_name].blank? && !@tea.types.nil? #selecting an existing type from the checkbox AND creating a new type (a tea that has more than one type)
        @tea.types << @tea.types.new(type_name: params[:type][:type_name])
        @tea.type_ids = params[:type][:type_ids]
      else params[:type][:type_name].blank? && !@tea.types.nil?
        @tea.type_ids = params[:type][:type_ids] #the type has already been created and is shown as checkboxes
      end
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
      @tea.types = Type.all
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
      @tea.update(params[:tea])
      if !params[:type][:type_name].blank? && @tea.types.nil? #creating the first type by creating its params as type_name
        @tea.types << @tea.types.new(type_name: params[:type][:type_name])
      elsif !params[:type][:type_name].blank? && !@tea.types.nil? #selecting an existing type from the checkbox AND creating a new type (a tea that has more than one type
        @tea.types << @tea.types.new(type_name: params[:type][:type_name])
        newly_added_tea = @tea.types.last.id.to_s
        c = params[:type][:type_ids]
        c << newly_added_tea
        @tea.type_ids = c
      else params[:type][:type_name].blank? && !@tea.types.nil?
        @tea.type_ids = params[:type][:type_ids] #the type has already been created and is shown as checkboxes
      end
      @tea.save
      flash[:message] = "Your Tea has been updated!"
      redirect "/users/#{current_user.slug}/teas/#{@tea.id}"
    end
  end

  delete '/users/:slug/teas/:id/delete' do
    if logged_in?
      @user = current_user
      @tea = Tea.find(params[:id])
      if @tea.user_id == session[:user_id]
        @tea.delete
        flash[:message] = "Your Tea has been removed from your crate!"
        redirect "/users/#{current_user.slug}/teas"
      else
        redirect "/users/#{current_user.slug}/teas"
      end
    else
      redirect '/login'
    end
  end


end
