class StudentsController < ApplicationController
  before_action :load_student

  def show
    render json: courses_of_teacher
  end

  private

  def load_student
  	@student = Student.find_by id: params[:id]
  	render_error_not_found unless @student
  end

  def courses_of_teacher
  	courses = Course.where(id: @student.course_ids).includes(:teacher)
  	courses.map do |course|
  		{id: course.id, name: course.name, teacher_name: course.teacher.name}
    end
  end
end
