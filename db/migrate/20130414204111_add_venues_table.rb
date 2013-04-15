class AddVenuesTable < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.integer :rating
      t.integer :total_votes
      t.timestamps
    end
  end
end