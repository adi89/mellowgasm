# == Schema Information
#
# Table name: motivations
#
#  id         :integer          not null, primary key
#  desire     :string(255)
#  categoryId :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Motivation < ActiveRecord::Base
attr_accessible :desire, :categoryId
has_and_belongs_to_many :users
has_many :venues



end
