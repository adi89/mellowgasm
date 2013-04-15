# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  gender          :string(255)
#  address         :string(255)
#  phone           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'
require "mocha/setup"

describe User do
  describe '.create' do
    it 'has an id' do
      user = User.create(:password => 'a', :password_confirmation => 'a')
      expect(user.id).to_not be nil
    end
  end
  describe '#friends' do
    it 'has many friends' do
      user = User.create(:password => 'a', :password_confirmation => 'a')
      user.friends << FactoryGirl.create(:friend)
      expect(user.friends.count).to eq 1
    end
  end
  describe '#motivations' do
    it 'has many motivations' do
      user = User.create(:password => 'a', :password_confirmation => 'a')
      user.motivations << FactoryGirl.create(:motivation)
      expect(user.motivations.count).to eq 1
    end
  end
  describe '#locations' do
    it 'has many locations' do
      user = User.create(:password => 'a', :password_confirmation => 'a')
      user.locations << FactoryGirl.create(:location)
      expect(user.locations.count).to eq 1
    end
  end
end
