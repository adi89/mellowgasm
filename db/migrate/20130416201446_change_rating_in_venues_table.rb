class ChangeRatingInVenuesTable < ActiveRecord::Migration
  def change
    change_column :venues, :rating, :decimal, :default => 0.0
  end
end
