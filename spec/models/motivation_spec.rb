# == Schema Information
#
# Table name: motivations
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  categoryId :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'

describe Motivation do
  describe '.create' do
    it 'has an id' do
      motivation = Motivation.create(:type => 'dive bar', :categoryId => "4bf58dd8d48988d118941735")
      expect(motivation.id).to_not be nil
    end
  end
  describe '#venues' do
    it 'has many venues' do
      motivation = Motivation.create(:type => 'dive bar', :categoryId => "4bf58dd8d48988d118941735")
      motivation.venues << FactoryGirl.create(:venue)
      expect(motivation.venues.count).to eq 1
    end
  end
end
