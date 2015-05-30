require 'rails_helper'

describe Student do

  context 'validations' do
    it { should have_many(:classrooms) }
    it { should have_many(:courses) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:register_number) }
    it { should validate_uniqueness_of(:register_number) }
    it { should validate_length_of(:name).is_at_most(45) }
    it { should validate_length_of(:register_number).is_at_most(45) }
  end
end