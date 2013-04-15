# == Schema Information
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  address       :string(255)
#  rating        :integer          default(0)
#  venue_url     :text
#  photo_url     :text
#  total_votes   :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  location_id   :integer
#  motivation_id :integer
#  latitude      :float
#  longitude     :float
#


FactoryGirl.define do
  factory :venue, class: Venue do
    name                  'Le Bain'
    address               '848 Washington Street NYC'
    rating                 3
    venue_url             "http://standardhotels.com/high-line"
    photo_url             "http://www.socialyeti.com/wp-content/uploads/2012/12/Le-Bain-NYC-View.jpg"
    total_votes            7
  end
end
