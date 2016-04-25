# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  payment     :integer
#  date        :date
#  card        :boolean
#  memo        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

class RecordsController < ApplicationController
  # devise
  before_action :authenticate_user!

  before_action :set_record, only: [:edit, :update, :destroy]
  before_action :set_own_categories, only: [:new, :create, :edit, :update, :bulk, :bulk_create]
  before_action :set_user_latest_record, only: [:index]

  # GET /records
  # GET /records.json
  def index
  end

  # GET /records/1
  # GET /records/1.json
  def show
    @year  = params[:year].to_i
    @month = params[:month].to_i
    date = Date.new(@year, @month, 10)

    @records = @user.records.page(params[:page]).per(10)
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        flash[:success] = '新しい支払いを追加しました'
        format.html { redirect_to records_path }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        flash[:success] = '支払いを更新しました'
        format.html { redirect_to records_path }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      flash[:success] = '支払いを削除しました'
      format.html { redirect_to records_path }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_latest_record
    @records = @user.records.order(:updated_at).reverse_order.page(params[:page]).per(10)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def set_own_categories
    # @own_categories = Category.where("user_id = #{current_user.id}")
    @own_categories = Category._own
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def record_params
    params.require(:record).permit(:money, :date, :category_id, :card, :memo, :user_id)
  end
end
