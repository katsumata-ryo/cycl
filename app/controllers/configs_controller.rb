class ConfigsController < ApplicationController
  before_action :set_categories

  def index
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_categories
    @categories = Category.where(user_id: current_user.id)
  end
end
