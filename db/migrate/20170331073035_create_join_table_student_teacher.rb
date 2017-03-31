class CreateJoinTableStudentTeacher < ActiveRecord::Migration[5.0]
  def change
    create_join_table :students, :teachers, id: false do |t|
      t.index [:student_id, :teacher_id]
      t.index [:teacher_id, :student_id]
    end
  end
end
