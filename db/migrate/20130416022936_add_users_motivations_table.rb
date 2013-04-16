class AddUsersMotivationsTable < ActiveRecord::Migration
  def change
    create_table :users_motivations, :id => :false do |t|
      t.integer :user_id
      t.integer :motivation_id
    end
  end
end
