class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def new
    @user = User.new();
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless true
  end

  def create
    @user = User.new(user_params)
    @user[:introduction] = "";
    if @user.save
      card = Card.new
      card.user_id = @user.id
      card.save

       if Rails.env == "development"
         log_in @user
         flash[:success] = "Welcome to the News+!"
         redirect_to root_path
       else
         @user.send_activation_email
         flash[:info] = "Please check your email to activate your account."
         redirect_to root_url
       end
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if params[:user]
      @user = User.find(params[:id])
      if @user.valid?
        if @user.update_attributes(user_params)
          flash[:success] = "Contact updated"
          redirect_to settings_setting_path
        else
          render 'user_setting/setting'
        end
      else
        flash[:danger] = "Input is missing"
        render 'user_setting/setting'
      end
    else
      flash[:danger] = "Input is missing"
      render 'user_setting/setting'
    end
  end

  def update_password
    UserSettingController.update_sub_path "password"
    # flash[:danger] = params.to_s
    # UserSettingController.lock_setting_path
    # redirect_to settings_setting_path
    # return

    if params[:user][:password]
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Password updated"
        UserSettingController.lock_setting_path
        redirect_to settings_setting_path
      else
        render 'user_setting/setting'
      end
    else
      flash[:danger] = "Password is empty"

      UserSettingController.lock_setting_path
      redirect_to settings_setting_path
    end
  end

  def update_avatar
    UserSettingController.update_sub_path "avatar"

    if params[:user]
      @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          flash[:success] = "Avatar updated"
          UserSettingController.lock_setting_path
          redirect_to settings_setting_path
        else
          UserSettingController.lock_setting_path
          redirect_to settings_setting_path
        end
    else
      # flash[:danger] = "Image is missing"
      UserSettingController.lock_setting_path
      redirect_to settings_setting_path
    end
  end

  def destroy
    User.find(params[:id]).destroy
    # flash[:success] = "User deleted"
    redirect_to users_url
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :mobile, :city, :introduction, :picture)
  end

  # Before filters
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end


end


