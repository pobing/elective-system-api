class TeachersController < ApplicationController
	before_action :load_teacher, only: :destroy

  def index
  	render json: teacher_of_courses
  end

  def destroy
  	@teacher.destroy
  	head :no_content
  end

  private

  def load_teacher
  	@teacher = Teacher.find_by id: params[:id]
  	render_error_not_found unless @teacher
  end

  def teacher_of_courses
  	per_page = params[:per_page] || 20
  	Teacher.paginate(:page => params[:page], :per_page => per_page).map do |teacher|
  		{id: teacher.id, name: teacher.name, courses: teacher.courses.select(:id, :name)}
  	end
  end
end
