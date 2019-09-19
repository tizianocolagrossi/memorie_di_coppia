class UsersController < ApplicationController
  # per reindirizzare al login le persone non autenticate 
  before_action :logged_in_user, only: [:edit, :update, :show]
  # per reindirizzare le persone che vogliono modificare o visualizzare un altro profilo
  before_action :correct_user,   only: [:edit, :update, :show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Benvenuto!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user  = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params_update)
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:hisName, :herName, :email, :anniversary,
                                  :password, :password_confirmation)
    end

    def user_params_update
      params.require(:user).permit(:email,
                                  :password, :password_confirmation)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Perfavore accedi."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
