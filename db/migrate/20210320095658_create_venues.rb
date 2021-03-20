class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :venue_name
      t.string :location

      t.timestamps
    end
  end
end
