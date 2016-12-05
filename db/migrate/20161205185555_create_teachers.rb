class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.integer "price"
      t.string "subject"
      t.string "postal_code"
      t.timestamps
    end
  end
end
