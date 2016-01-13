class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_login_user

  private

  def set_login_user
    if current_user
      @user = User.find(current_user.id)
    end
  end
end
