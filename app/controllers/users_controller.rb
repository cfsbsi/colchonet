class UsersController < ApplicationController


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

  # def user_params_edit
  #   params.require(:user).permit(:full_name, :email,  :location, :bio).except
  # end
end
