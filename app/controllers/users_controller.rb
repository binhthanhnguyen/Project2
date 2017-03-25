class UsersController < ApplicationController
  load_and_authorize_resource
  include Devise::Controllers::Helpers
  # before_filter :authenticate_user!
  # protect_from_forgery prepend: true
  before_action :authenticate_user!, except: [ :index]


  # before_action :correct_user,   only: [:edit, :update]



  def show
  	@user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user

    else
      render 'edit'
    end
  end



  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user 
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
