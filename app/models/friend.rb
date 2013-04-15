# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friend < ActiveRecord::Base
attr_accessible :name, :phone
belongs_to :users





end