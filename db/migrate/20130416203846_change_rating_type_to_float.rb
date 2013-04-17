class ChangeRatingTypeToFloat < ActiveRecord::Migration
  def change
    change_column :venues, :rating, :float, :default => 0
  end
end
