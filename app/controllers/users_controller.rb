class UsersController < ApplicationController
  def edit
     @user= User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
  end
end

  def show
    @book_new=Book.new
    @user= User.find(params[:id])
  end
  def destroy
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
     render :edit
    end
  end
  def index
    @book=Book.new
    @books=Book.all
    @user= current_user
    @users=User.all
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
