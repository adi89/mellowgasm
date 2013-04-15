class AddVenueIdColumnToVenueTable < ActiveRecord::Migration
  def change
    add_column :venues, :venue_Id, :integer
  end
end
