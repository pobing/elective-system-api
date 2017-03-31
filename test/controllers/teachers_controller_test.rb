require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    teacher = create_teacher
    teacher.courses.create([{name: 'Ruby'}, {name: 'JavaScript'}])
  	expect = [
      { 
        "id" => teacher.id,
        "name" => teacher.name,
        "courses" => [
        	{
            "id" => teacher.courses.first.id,
            "name" => teacher.courses.first.name
        	},
        	{
            "id" => teacher.courses.last.id,
            "name" => teacher.courses.last.name
        	}
        ]
      }
  	]

    get teachers_url
    assert_response :success
    assert_equal expect, JSON.parse(@response.body)
  end

  test 'should return 20 records with default per_page' do
  	21.times {|i| create_teacher name: "teacher_#{i}"}
    get teachers_url
    assert_response :success
    assert_equal 20, JSON.parse(@response.body).size
  end

  test 'should return 10 records if per_page is 10' do
  	11.times {|i| create_teacher name: "teacher_#{i}"}
    get teachers_url, params: {per_page: 10}
    assert_response :success
    assert_equal 10, JSON.parse(@response.body).size
  end

  test 'should destroy teacher' do 
  	teacher = create_teacher
    teacher.courses.create(name: 'Ruby')
    assert_difference('Teacher.count', -1) do
      delete teacher_url(teacher)
    end
  end

end
