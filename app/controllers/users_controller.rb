class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Breaking!"
      redirect_to @user
      # TODO: Where do we go to now?
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  def edit
  end
end
