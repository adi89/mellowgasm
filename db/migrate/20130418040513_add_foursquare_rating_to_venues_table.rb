class AddFoursquareRatingToVenuesTable < ActiveRecord::Migration
  def change
    add_column :venues, :foursquare_rating, :float, :default => 0
  end
end
