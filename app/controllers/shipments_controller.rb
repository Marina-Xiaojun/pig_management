class ShipmentsController < ApplicationController
  # 出荷入力画面
  def new
    @shipment = Shipment.new
    @pig_houses = PigHouse.all
    @destinations = Destination.all
  end

  # 出荷一覧画面
  def index
    @shipments = Shipment.includes(:pig_house, :destination)
                         .order(shipment_date: :desc)
  end

  # 出荷登録処理
  def create
    @shipment = Shipment.new(shipment_params)

    if @shipment.save
      redirect_to shipments_path
    else
      @pig_houses = PigHouse.all
      @destinations = Destination.all
      render :new, status: :unprocessable_entity
    end
  end


  # 出荷記録の削除
  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy

    redirect_to shipments_path
  end

  private

  # 登録できる項目を指定する
  def shipment_params
    params.require(:shipment).permit(
      :shipment_date,
      :pig_house_id,
      :destination_id,
      :head_count,
      :age_months
    )
  end
end
