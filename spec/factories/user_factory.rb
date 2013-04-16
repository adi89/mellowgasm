# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  gender          :string(255)
#  address         :string(255)
#  phone           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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
