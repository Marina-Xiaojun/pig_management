class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  # ログイン中の従業員を取得する
  before_action :set_current_employee
  before_action :require_login

  private

  def set_current_employee
    @employee = Employee.find_by(id: session[:employee_id])
  end

  def require_login
    return if @employee

    allowed_actions = {
      "welcome" => ["index"],
      "sessions" => ["new", "create", "guest_login"],
      "employees" => ["new", "create"]
    }

    #現在のコントローラー名に対応する配列の中に、現在のアクション名が含まれているか
    return if allowed_actions[controller_name]&.include?(action_name)

    redirect_to root_path, alert: "ログインしてください"
  end

end

