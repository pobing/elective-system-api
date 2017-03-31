require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test 'should return not found if student id is invalid' do
    get student_url(id: 1)
    assert_response :not_found
  end

  test 'should return success' do
    teacher = create_teacher
    course = teacher.courses.create name: 'Ruby' 
  	student = Student.create name: 'stu1'
  	student.courses << course
  	expect = [
      {
      	"id"=> student.id, 
        "name"=> course.name, 
        "teacher_name"=> teacher.name
      }
    ]

  	get student_url(id: student.id)
  	assert_response :success
  	assert_equal expect, JSON.parse(@response.body)
  end

end
