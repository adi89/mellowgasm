class ChangeTwitterAndUrlOnVenues < ActiveRecord::Migration
  def change
    change_column :venues, :twitter, :string, :default => ""
    add_column :venues, :venue_url, :string, :default => ""
  end
end
