# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#


require 'spec_helper'
require "mocha/setup"

describe Location do
  describe '.create' do
    it 'has an id' do
      location = Location.create(:address => '13th and 9th ave', :latitude => 44.78957, :longitude => 95.808549)
      expect(location.id).to_not be nil
    end
  end
  describe '#venues' do
    it 'has many venues' do
      location = Location.create(:address => '13th and 9th ave', :latitude => 44.78957, :longitude => 95.808549)
      location.venues << FactoryGirl.create(:venue)
      expect(location.venues.count).to eq 1
    end
  end

end
