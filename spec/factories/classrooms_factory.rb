FactoryGirl.define do
  factory :classroom do
    student
    course
    entry_at Time.now
  end
end