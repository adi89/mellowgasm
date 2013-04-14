class AddPhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :gender
      t.string :url
      t.timestamps
    end
  end
end