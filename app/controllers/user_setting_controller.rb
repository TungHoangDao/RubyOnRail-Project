class UserSettingController < ApplicationController

  @@setting_sub_path = ""

  @@lock_setting = false

  def new
  end

  def profile
    @path = settings_profile_path
    @user = current_user
  end

  def setting
    @user = current_user
    @path = settings_setting_path
    if !@@lock_setting
      @@setting_sub_path = "contact"
    end
      @@lock_setting = false

  end


  def my_posts
    @path = settings_my_posts_path
    @user = current_user

  end

  def my_comments
    @path = settings_my_comments_path
    @user = current_user

  end

  def comments_to_me
    @path = settings_comments_to_me_path
    @user = current_user

  end

    def self.lock_setting_path
      @@lock_setting = true
    end

  def self.update_sub_path(path)
    @@setting_sub_path = path
  end

  def self.current_sub_path
    return @@setting_sub_path
  end

  def self.is_contact_active
    return @@setting_sub_path == "contact" ? "in active" : ""
  end

  def self.is_avatar_active
    return @@setting_sub_path == "avatar" ? "in active" : ""
  end

  def self.is_password_active
    return @@setting_sub_path == "password" ? "in active" : ""
  end

  def self.is_verification_active
    return @@setting_sub_path == "verification" ? "in active" : ""
  end

  private

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    else
      if (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
    end
  end


end
