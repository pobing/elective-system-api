class CreateJoinTableStudentCourse < ActiveRecord::Migration[5.0]
  def change
    create_join_table :students, :courses, id: false do |t|
      t.index [:student_id, :course_id]
      t.index [:course_id, :student_id]
    end
  end
end
