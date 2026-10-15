class HomeController < ApplicationController
  def index
   @employee = Employee.find_by(id: session[:employee_id])
  end
end
