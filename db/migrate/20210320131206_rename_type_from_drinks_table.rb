class RenameTypeFromDrinksTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :drinks, :type, :name 
  end
end