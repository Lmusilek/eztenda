class ExtendingVenueAddress < ActiveRecord::Migration[6.0]
  def change
    remove_column :venues, :location
    add_column :venues, :region, :string
    add_column :venues, :city, :string
    add_column :venues, :post_code, :string
  end
end
