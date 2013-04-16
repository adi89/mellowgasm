class ChangeFoursquareIdName < ActiveRecord::Migration
  def change
    rename_column :venues, :foursquareId, :foursquare_identification
  end

end
