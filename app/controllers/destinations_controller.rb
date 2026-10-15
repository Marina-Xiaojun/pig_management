class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])

    if @destination.update(destination_params)
      redirect_to destinations_path
    else
      render :edit
    end
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_to destinations_path, notice: "出荷先を登録しました"
    else
      render :new
    end
  end

  # 出荷先の削除処理
  def destroy
    @destination = Destination.find(params[:id])

    if Shipment.exists?(destination_id: @destination.id)
      redirect_to destinations_path,
                  alert: "出荷記録で使用中のため削除できません"
    else
      @destination.destroy
      redirect_to destinations_path, notice: "出荷先を削除しました"
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:name)
  end

end
