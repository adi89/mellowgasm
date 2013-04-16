class ChangeFoursquareIdToAString < ActiveRecord::Migration
  def change
    change_column :venues, :foursquareId, :string
  end

end
