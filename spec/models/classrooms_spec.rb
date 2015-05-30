require 'rails_helper'

describe Classroom do

  context 'validations' do
    it { should belong_to(:student) }
    it { should belong_to(:course) }
    it { should validate_presence_of(:student) }
    it { should validate_presence_of(:course) }
    it { should validate_presence_of(:entry_at) }
  end
end