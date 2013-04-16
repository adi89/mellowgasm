class RenameTypeMotivationTable < ActiveRecord::Migration
  def change
  rename_column :motivations, :type, :desire
  end

end
