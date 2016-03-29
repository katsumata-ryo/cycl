class Api::Plans::UsersController < ApplicationController
  PER = 5

  def index
    @plans = Plan.where(user_id: params[:id]).order(created_at: :desc).page(params[:page]).per(PER)
  end
end
