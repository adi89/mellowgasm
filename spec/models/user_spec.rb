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

describe User do
  describe '.create' do
    it 'has an id' do
      user = User.create(:password => 'a', :password_confirmation => 'a')
      expect(user.id).to_not be nil
    end
  end

end
