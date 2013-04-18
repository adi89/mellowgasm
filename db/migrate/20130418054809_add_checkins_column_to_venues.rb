class AddCheckinsColumnToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :checkins, :float, :default => 0.0
  end
end
