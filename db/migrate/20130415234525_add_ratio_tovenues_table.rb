class AddRatioTovenuesTable < ActiveRecord::Migration
  def change
    add_column :venues, :ratio, :decimal, :default => 0
  end
end
