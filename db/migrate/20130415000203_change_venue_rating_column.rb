class ChangeVenueRatingColumn < ActiveRecord::Migration
  def change
    change_column :venues, :rating, :integer, :default => 0
    change_column :venues, :total_votes, :integer, :default => 0
  end

end

