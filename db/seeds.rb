# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

COURSES_NAMES = %w(Chinese Math English)

3.times {|i| Teacher.create(name: "teacher_#{i+1}")}

Teacher.all.each do |teacher|
	teacher.courses.create([{name: COURSES_NAMES.sample}, {name: COURSES_NAMES.sample}])
end

3.times.each do |i|
  stu = Student.create name: "stu_#{i+1}"
  teacher = Teacher.find(i+1)
  stu.teachers << teacher

  teacher.courses.each do |course|
  	stu.courses << course
  end 
end