class AddFieldToTeacher < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :bio, :text
    add_column :teachers, :picture, :string
    add_column :teachers, :teaching_since, :date
    add_column :teachers, :street_address, :string
    add_column :teachers, :city, :string
    add_column :teachers, :province, :string
  end
end
