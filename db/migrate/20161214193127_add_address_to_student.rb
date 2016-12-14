class AddAddressToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :street_address, :string
    add_column :students, :city, :string
    add_column :students, :postal_code, :string
  end
end
