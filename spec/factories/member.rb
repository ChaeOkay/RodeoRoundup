FactoryGirl.define do
  factory :member do
    sequence(:username) { |number| "username-#{number}" }
    first_name  'Beatrix'
    last_name   'Kiddo'
  end
end
