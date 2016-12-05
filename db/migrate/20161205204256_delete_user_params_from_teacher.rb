class DeleteUserParamsFromTeacher < ActiveRecord::Migration[5.0]
  def change
    def change_table(:teachers) do |t|
        t.remove :first_name, :last_name, :email
    end
  end
end
