class UsersController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    if @user == current_user
      else
        redirect_to home_path
        flash[:error] = "Not authorized"
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      render :edit
    else
      flash[:error] = "You can only edit your own profile"
      redirect_to home_path
    end
  end

  def update
    if access?(@user.id) && @user.update_attributes(user_params)
      flash[:notice] = "User information updated successfully"
      redirect_to user_path
    else
      redirect_to home_path
      flash[:error] = @user.errors.full_messages.join(", ")
    end
  end

  def index
    @users = User.all
    render :index
  end

  private

  def access?(user_id)
    current_user ? user_id == current_user.id : false
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :company)
  end

end
