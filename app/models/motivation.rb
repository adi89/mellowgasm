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

class Motivation < ActiveRecord::Base
attr_accessible :type, :categoryId
belongs_to :user
has_many :venues



end
