# == Schema Information
#
# Table name: salaries
#
#  id         :integer          not null, primary key
#  year       :integer
#  money      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SalariesController < ApplicationController
  # devise
  before_action :authenticate_user!
  before_action :set_salary, only: [:show, :edit, :update, :destroy]
  before_action :set_user_salaries, only: [:index]

  # GET /salaries
  # GET /salaries.json
  def index
    @salaries = Salary.all
  end

  # GET /salaries/1
  # GET /salaries/1.json
  def show
  end

  # GET /salaries/new
  def new
    @salary = Salary.new
  end

  # GET /salaries/1/edit
  def edit
  end

  # POST /salaries
  # POST /salaries.json
  def create
    @salary = Salary.new(salary_params)

    respond_to do |format|
      if @salary.save
        format.html { redirect_to configs_path, notice: '新しい給料情報を追加しました' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /salaries/1
  # PATCH/PUT /salaries/1.json
  def update
    respond_to do |format|
      if @salary.update(salary_params)
        format.html { redirect_to configs_path, notice: '給料情報を更新しました' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /salaries/1
  # DELETE /salaries/1.json
  def destroy
    @salary.destroy
    respond_to do |format|
      format.html { redirect_to configs_path, notice: '給料情報を削除しました' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_salary
    @salary = Salary.find(params[:id])
  end

  def set_user_salaries
    @user_salaries = @user.salaries
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def salary_params
    params.require(:salary).permit(:year, :money, :user_id, :enable)
  end
end
