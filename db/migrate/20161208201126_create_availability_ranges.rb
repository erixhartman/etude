class CreateAvailabilityRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :availability_ranges do |t|
      t.integer :teacher_id
      t.integer :weekday
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
