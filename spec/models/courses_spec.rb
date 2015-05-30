require 'rails_helper'

describe Course do

  context 'validations' do
    it { should have_many(:students) }
    it { should have_many(:classrooms) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:name).is_at_most(45) }
    it { should validate_length_of(:description).is_at_most(45) }
  end
end