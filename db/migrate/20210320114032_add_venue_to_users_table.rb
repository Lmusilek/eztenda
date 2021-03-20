class AddVenueToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :venue_name, :string
  end
end
