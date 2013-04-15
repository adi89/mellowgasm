FactoryGirl.define do
  factory :user, class: User do
    name                  'Adi'
    email                 'adi@gmail.com'
    password              'a'
    password_confirmation 'a'
    gender                'male'
    address               '575 Grand Street'
    phone                 '7324039102'
  end
end
