require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  describe 'relationships' do
    it { should have_many(:applications) }
    it { should have_many(:pets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:application_id) }
    it { should validate_presence_of(:pet_id) }
  end

  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)

    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: false)
    @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)

    @application1 = Application.create!(name: 'John Doe', address: '123 Elm St', city: 'Denver', state: 'CO',
                                        zip: '12345', description: 'Looking for a friendly dog', status: 'In Progress')
  end

  describe 'class methods ' do
    it '' do
    end
  end
end
