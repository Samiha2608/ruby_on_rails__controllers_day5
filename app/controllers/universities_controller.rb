class UniversitiesController < ApplicationController
  def department_info
    @university_id = params[:university_id]
    @department_id = params[:department_id]
  end
end
