FactoryGirl.define do
  factory :user do
    provider 'developer'
    uid '1'
    name 'Mike'
  end

  factory :game do
    current_turn 1
    association :creator, factory: :user
  end
end
