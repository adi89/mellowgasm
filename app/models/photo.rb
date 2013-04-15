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

class Photo < ActiveRecord::Base
attr_accessible :gender, :url
belongs_to :venue






end
