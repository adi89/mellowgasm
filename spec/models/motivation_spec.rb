# == Schema Information
#
# Table name: motivations
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  categoryId :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Motivation do
  describe '.create' do
    it 'has an id' do
      motivation = Motivation.create(:type => 'dive bar', :categoryId => "4bf58dd8d48988d118941735")
      expect(motivation.id).to_not be nil
    end
  end

end
