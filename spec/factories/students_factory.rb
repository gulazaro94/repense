FactoryGirl.define do
  factory :student do
    name 'Test Name'
    register_number '12345678'
    status Student::ACTIVE_STATUS
  end
end