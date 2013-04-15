class AddMotivationsTable < ActiveRecord::Migration
  def change
    create_table :motivations do |t|
      t.string :type
      t.string :categoryId
      t.timestamps
    end
  end
end