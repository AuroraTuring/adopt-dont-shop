require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe "relationships" do
    it { should have_many(:applications) }
    it { should have_many(:pets) }
  end

  describe "validations" do
    it { should validate_presence_of(:application_id) }
    it { should validate_presence_of(:pet_id) }
  end
