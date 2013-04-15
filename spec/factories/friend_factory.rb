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

FactoryGirl.define do
  factory :friend, class: Friend do
    name                  'Ralph'
    phone                   "6096906090"
  end
end
