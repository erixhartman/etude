class RemoveStudentIDandTeacherId < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :student_id, :integer
    remove_column :users, :teacher_id, :integer
  end
end
