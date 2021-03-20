class AddingDescriptionToVenue < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :description, :text
  end
end
