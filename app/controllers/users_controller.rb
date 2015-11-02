class UsersController < ApplicationController
  before_filter :require_no_authentication, :only => [:new, :create]
  before_filter :can_change, :only => [:edit, :update]
  before_filter :require_authentication, :only => :rooms

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, :notice => 'Cadastro criado com sucesso!'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => "Update done!:)"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :location, :bio)
  end

  def can_change
    unless user_signed_in? && current_user == user
      redirect_to user_path(params[:id])
    end
  end

  def user
    @user ||= User.find(params[:id])
  end

  def rooms
    @rooms =  User.find(params[:id]).rooms.order('created_at desc') #  current_user.rooms.
  end
end
