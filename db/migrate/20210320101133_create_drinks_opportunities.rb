class CreateDrinksOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks_opportunities do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :quantity
      t.references :drink, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.references :bid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
