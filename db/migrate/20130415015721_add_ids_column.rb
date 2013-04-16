class AddIdsColumn < ActiveRecord::Migration
  def change
    add_column :venues, :location_id, :integer
    add_column :venues, :motivation_id, :integer
    add_column :photos, :venue_id, :integer
    add_column :locations, :user_id, :integer
    add_column :friends, :user_id, :integer
  end

end
