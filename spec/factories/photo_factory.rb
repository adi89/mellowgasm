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

FactoryGirl.define do
  factory :photo, class: Photo do
    gender                'female'
    url                   "http://rack.0.mshcdn.com/media/ZgkyMDEyLzEyLzA0LzZkL21pY2hlbGxlb2JhLmNyby5qcGcKcAl0aHVtYgk5NTB4NTM0IwplCWpwZw/51c2e44f/1fd/michelle-obama-joins-twitter-d92977f91a.jpg"
  end
end
