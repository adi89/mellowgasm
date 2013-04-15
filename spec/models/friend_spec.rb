# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'spec_helper'
require "mocha/setup"

describe Friend do
  describe '.create' do
    it 'has an id' do
      friend = Friend.create(:name => 'Ralph', :phone => '6096906090')
      expect(friend.id).to_not be nil
    end
  end
end
