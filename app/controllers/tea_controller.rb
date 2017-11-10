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

  post '/users/:slug/teas' do
    if params.values.any? {|value| value == ""}
      flash[:message] = "Please enter all fields."
      redirect "/users/#{@user.slug}/teas/new"
    else
      user = current_user
      @tea = Tea.create
      @tea.tea_name = params[:tea][:tea_name]
      @tea.user_id = user.id
      # binding.pry
      @tea.save
      @type = Type.create(params[:tea][:type])
      @tea.types << @type
      @tea.save
      flash[:message] = "New Tea added to crate!"
      # binding.pry
      redirect "/users/#{@user.slug}/teas/#{@tea.id}"
    end
  end

  get '/users/:slug/teas/:id' do
    if logged_in?
      @user = current_user
      @tea = Tea.find(params[:id])
      # binding.pry
      # @type = Type.find(params[:id])
      erb :'/teas/show_tea'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/teas/:id/edit' do
    if logged_in?
      @user = current_user
      @tea = Tea.find(params[:id])
      if @tea.user_id == session[:user_id]
        erb :'/teas/edit_tea'
      else
        erb :'/teas/index'
      end
    else
      redirect '/login'
    end
  end

  patch '/users/:slug/teas/:id' do
    if params.has_value?("")
      flash[:message] = "Please enter all fields."
      redirect "/users/#{@user.slug}/teas/edit"
    else
      @user = current_user
      @tea = Tea.find(params[:id])
      # binding.pry
      @tea.tea_name = params[:tea][:tea_name] #tea_name can change
      @tea.types = params[:tea][:type] #tea types can change
      @tea.save
      flash[:message] = "Your Tea has been updated!"
      redirect "/users/#{@user.slug}/teas/#{@tea.id}"
    end
  end

  delete '/users/:slug/teas/:id/delete' do
    if logged_in?
      @user = current_user
      @tea = Tea.find(params[:id])
      @type = Type.find(params[:type_id])
      if @tea.user_id == session[:user_id]
        @tea.delete
        @type.delete
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
