class PigHousesController < ApplicationController

  def index
    @pig_houses = PigHouse.all
  end

  def edit
    @pig_house = PigHouse.find(params[:id])
  end

  def update
  @pig_house = PigHouse.find(params[:id])

    if @pig_house.update(pig_house_params)
        redirect_to pig_houses_path, notice: "豚舎を変更しました！"
    else
       render :edit
    end
 end

  def new
    @pig_house = PigHouse.new
  end

 def create
    @pig_house = PigHouse.new(pig_house_params)

    if @pig_house.save
      redirect_to pig_houses_path, notice: "豚舎を登録しました"  
    else
      render :new
    end
  end

 def destroy
  @pig_house = PigHouse.find(params[:id])

  if Introduction.exists?(pig_house_id: @pig_house.id) ||
     Shipment.exists?(pig_house_id: @pig_house.id)

    redirect_to pig_houses_path,
                alert: "導入記録または出荷記録で使用中のため削除できません"
  else
    @pig_house.destroy
    redirect_to pig_houses_path, notice: "豚舎を削除しました"
  end
end

  private

  def pig_house_params
    params.require(:pig_house).permit(:name)
  end

end