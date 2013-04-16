class AddDistanceColumnToVenuesTable < ActiveRecord::Migration
  def change
    add_column :venues, :distance, :integer
  end
end
