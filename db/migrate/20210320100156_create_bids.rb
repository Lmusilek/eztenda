class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.boolean :is_accepted, default: false
      t.string :contract
      t.integer :price
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
