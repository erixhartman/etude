class AddLessonType < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :format, :string
  end
end
