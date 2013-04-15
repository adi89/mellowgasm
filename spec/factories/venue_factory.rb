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
