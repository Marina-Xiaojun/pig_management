
class SessionsController < ApplicationController
  def new
  end

  def create
    employee = Employee.find_by(employee_id: params[:employee_id])

    if employee&.authenticate(params[:password])
      session[:employee_id] = employee.id
      redirect_to "/home/index", notice: "ログインしました"
    else
      flash.now[:alert] = "従業員IDまたはパスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:employee_id)
    redirect_to root_path, notice: "ログアウトしました"
  end

 #ゲストログイン機能
  def guest_login
    employee = Employee.find_or_create_by!(employee_id: "guestdemo") do |new_employee|
      new_employee.name = "ゲスト"
      new_employee.password = "guestpassword123"
      new_employee.password_confirmation = "guestpassword123"
    end

    session[:employee_id] = employee.id
    redirect_to "/home/index", notice: "ゲストとしてログインしました"
  end

end

