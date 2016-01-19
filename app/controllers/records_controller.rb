class RecordsController < ApplicationController
  # devise
  before_action :authenticate_user!

  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :set_own_categories, only: [:new, :create, :edit, :update, :bulk, :bulk_create]
  before_action :set_user_latest_record, only: [:index]

  # GET /records
  # GET /records.json
  def index
  end

  # GET /records/1
  # GET /records/1.json
  def show
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
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET bulk/:number
  def bulk
  end

  # POST bulk
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user_latest_record
      @user_latest_record = @user.records._latest
    end

    def set_record
      @record = Record.find(params[:id])
    end

    def set_own_categories
      # @own_categories = Category.where("user_id = #{current_user.id}")
      @own_categories = Category.own
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:payment, :date, :category_id, :card, :memo, :user_id)
    end
end
