FactoryGirl.define do
  factory :course do
    name 'Course Name'
    description 'Course description'
    status Course::ACTIVE_STATUS
  end
end