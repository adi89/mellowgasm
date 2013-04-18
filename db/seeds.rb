Motivation.delete_all
Venue.delete_all
Photo.delete_all
Friend.delete_all
User.delete_all
Location.delete_all


Location.create(:address => '575 Grand Street NYC')
Location.create(:address => '10 East 21st Street NYC')



Motivation.create(:desire => 'All Nightlife', :categoryId => '4d4b7105d754a06376d81259')
Motivation.create(:desire => 'All Bars', :categoryId => '4bf58dd8d48988d116941735')
Motivation.create(:desire => 'Dive Bars', :categoryId => '4bf58dd8d48988d118941735')
Motivation.create(:desire => 'Gay Bars', :categoryId => '4bf58dd8d48988d1d8941735')
Motivation.create(:desire => 'Lounges', :categoryId => '4bf58dd8d48988d121941735')
Motivation.create(:desire => 'The Club Scene', :categoryId => '4bf58dd8d48988d11f941735')

Venue.make_venues(Location.first, Motivation.first)


Venue.all.each do |venue|
  Photo.photo_create(venue)
  Venue.ratio(venue)
end

