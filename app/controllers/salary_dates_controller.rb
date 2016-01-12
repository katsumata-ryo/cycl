class SalaryDatesController < ApplicationController
  # devise
  before_action :authenticate_user!
  before_action :set_salary_date, only: [:show, :edit, :update, :destroy]
  before_action :set_user_salary_date, only: [:index, :show]

  # GET /salary_dates
  # GET /salary_dates.json
  def index
  end

  # GET /salary_dates/1
  # GET /salary_dates/1.json
  def show
  end

  # GET /salary_dates/new
  def new
    @salary_date = SalaryDate.new
  end

  # GET /salary_dates/1/edit
  def edit
  end

  # POST /salary_dates
  # POST /salary_dates.json
  def create
    @salary_date = SalaryDate.new(salary_date_params)

    respond_to do |format|
      if @salary_date.save
        format.html { redirect_to @salary_date, notice: 'Salary date was successfully created.' }
        format.json { render :show, status: :created, location: @salary_date }
      else
        format.html { render :new }
        format.json { render json: @salary_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salary_dates/1
  # PATCH/PUT /salary_dates/1.json
  def update
    respond_to do |format|
      if @salary_date.update(salary_date_params)
        format.html { redirect_to @salary_date, notice: 'Salary date was successfully updated.' }
        format.json { render :show, status: :ok, location: @salary_date }
      else
        format.html { render :edit }
        format.json { render json: @salary_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salary_dates/1
  # DELETE /salary_dates/1.json
  def destroy
    @salary_date.destroy
    respond_to do |format|
      format.html { redirect_to salary_dates_url, notice: 'Salary date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salary_date
      @salary_date = SalaryDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def salary_date_params
      params.require(:salary_date).permit(:cutoff, :user_id)
    end

    def set_user_salary_date
      @user_salary_date = @user.salary_date
    end
end
