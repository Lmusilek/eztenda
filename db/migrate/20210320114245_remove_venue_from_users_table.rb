class RemoveVenueFromUsersTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :venue_name
  end
end
