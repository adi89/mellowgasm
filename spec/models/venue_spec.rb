# == Schema Information
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  address       :string(255)
#  rating        :integer          default(0)
#  venue_url     :text
#  photo_url     :text
#  total_votes   :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location_id   :integer
#  motivation_id :integer
#  latitude      :float
#  longitude     :float
#  twitter       :string(255)
#  phone         :string(255)
#  crossStreet   :text
#  venue_Id      :integer
#

require 'spec_helper'
require 'mocha/setup'

describe Venue do
  describe '.create' do
    it 'has an id' do
      venue = Venue.create(:name => 'a', :total_votes => 0)
      expect(venue.id).to_not be nil
    end
  end
  describe '#photos' do
    it 'has many photos' do
      venue = Venue.create(:name => 'a', :total_votes => 0)
      venue.photos << FactoryGirl.create(:photo)
      expect(venue.photos.count).to eq 1
    end
  end


end
