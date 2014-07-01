FactoryGirl.define do
  factory :organization do
    member
    sequence(:name) { |number| "organiation-#{number}" }
    address_1   '10 Main St.'
    address_2   nil
    city        'Atlanta'
    state       'GA'
    zip         '30307'
    phone       '321-123-1234'
  end
end
