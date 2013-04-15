class AddMoreToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :twitter, :string
    add_column :venues, :phone, :string
    add_column :venues, :crossStreet, :text
  end
end