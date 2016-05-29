class UsersController < ApplicationController
  def show
    if User.exists? params[:id]
      @user = User.find(params[:id]) || "No User"
        render :show
    else
      redirect_to home_path
    end
  end

  def edit
    if User.exists? params[:id]
      @user = User.find(params[:id])
      if current_user == @user
        render :edit
      else
        flash[:error] = "You can only edit your own profile"
        redirect_to home_path
      end
    else
      redirect_to home_path
    end
  end

  def update
    set_user
    if @user.update_attributes(user_params)
      flash[:notice] = "User information updated successfully"
    else
       flash[:error] = @user.errors.full_messages.join(", ")
    end
    redirect_to user_path(@user)
  end

  def index
    @users = User.all
    render :index
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :company)
  end

  def set_user
    user_id = params[:id]
    @user = User.find(user_id)
  end

end
