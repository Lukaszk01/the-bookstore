class AddFirstNameToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :first_name, :string
  end
end
