# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  gender     :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  venue_id   :integer
#

require 'spec_helper'
require "mocha/setup"

describe Photo do
  describe '.create' do
    it 'has an id' do
      photo = Photo.create(:gender => 'a', :url => 'https://www.google.com')
      expect(photo.id).to_not be nil
    end
  end

end
