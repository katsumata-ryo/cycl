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

  def index
  end

  def new
    @record = Record.new
  end

  def edit
  end

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

  def destroy
    @record.destroy
    respond_to do |format|
      flash[:success] = '支払いを削除しました'
      format.html { redirect_to records_path }
    end
  end

  def bulk
  end

  def bulk_create
    records = []

    0.upto(params['bulk']['number'].to_i - 1) do |n|
      date = Date.new(params['bulk']["date#{n}"]["d(1i)"].to_i, params['bulk']["date#{n}"]["d(2i)"].to_i, params['bulk']["date#{n}"]["d(3i)"].to_i)

      records << Record.new(
        payment:     params['bulk']['payment'],
        date:        date,
        category_id: params['bulk']['category_id'],
        card:        params['bulk']['card'],
        memo:        params['bulk']['memo'],
        user_id:     params['bulk']['user_id'],
      )
    end

    result = Record.import(records)
    if result['failed_instances'].empty?
      redirect_to records_url, notice: "#{params['bulk']['number']}件のレコードを登録しました"
    else
      redirect_to records_url, notice: "レコードの登録に失敗しました、レコードを確認して下さい: #{result['failed_instances'].map{|f| f.date}.join("と")}が失敗"
    end
  end

  private

  # TODO: summary_controllerと重複
  def this_month_range(date)
    @date        = date
    @salary_date = 10

    from_date...to_date
  end

  def from_date
    if @date.day >= @salary_date
      Date.new(@date.year, @date.month, @salary_date)
    else
      Date.new(@date.last_month.year, @date.last_month.month, @salary_date)
    end
  end

  def to_date
    if @date.day >= @salary_date
      Date.new(@date.next_month.year, @date.next_month.month, @salary_date)
    else
      Date.new(@date.year, @date.month, @salary_date)
    end
  end

    def set_user_latest_record
      @records = @user.records.order(:updated_at).reverse_order.page(params[:page]).per(10)
    end

    def set_record
      @record = Record.find(params[:id])
    end

    def set_own_categories
      @own_categories = Category._own
    end

    def record_params
      params.require(:record).permit(:payment, :date, :category_id, :card, :memo, :user_id)
    end
end
