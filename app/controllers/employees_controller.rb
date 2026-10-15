class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      session[:employee_id] = @employee.id
      redirect_to "/home/index", notice: "従業員登録が完了しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def employee_params
    params.require(:employee).permit(
      :name,
      :employee_id,
      :password,
      :password_confirmation
    )
  end
end
