class RenameVenueIdToFoursquareId < ActiveRecord::Migration
  def change
    rename_column :venues, :venue_Id, :foursquareId
  end

end
