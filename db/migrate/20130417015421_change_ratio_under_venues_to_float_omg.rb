class ChangeRatioUnderVenuesToFloatOmg < ActiveRecord::Migration
  def change
    change_column :venues, :ratio, :float, :default => 0
  end
end
