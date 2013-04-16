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

FactoryGirl.define do
  factory :motivation, class: Motivation do
    type                 "Dive Bar"
    categoryId          "4bf58dd8d48988d118941735"
  end
end
