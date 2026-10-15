
class IntroductionsController < ApplicationController
  def new
    @pig_houses = PigHouse.all
    @introduction = Introduction.new
  end

  def index
  @introductions = Introduction.includes(:pig_house).order(introduction_date: :desc)
  end

  def create
    @introduction = Introduction.new(introduction_params)

    if @introduction.save
      redirect_to introductions_path, notice: "導入記録を登録しました"
    else
      @pig_houses = PigHouse.all
      render :new, status: :unprocessable_entity
    end
  end

 # 導入記録の削除
  def destroy
    @introduction = Introduction.find(params[:id])
    @introduction.destroy

    redirect_to introductions_path
  end

  private

  def introduction_params
    params.require(:introduction).permit(
      :introduction_date,
      :pig_house_id,
      :head_count,
      :age_months
    )
  end
end
