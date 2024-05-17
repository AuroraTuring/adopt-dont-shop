require 'rails_helper'

RSpec.describe 'applications show page' do
  before(:each) do
    @shelter1 = Shelter.create!(foster_program: true, name: 'Whimsy Whiskers', city: 'Denver', rank: 42)
    # @pet1 = Pet.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true, shelter: @shelter1)
    @pet1 = @shelter1.pets.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true)
    @application1 = Application.create!(name: 'John Doe', address: '123 Elm St',
                                        description: 'Looking for a friendly dog', status: 'Pending')
    PetApplication.create!(pet: @pet1, application: @application1)
  end
  describe 'as a visitor' do
    describe 'when I visit an applications show page' do
      it 'then I can see their attributes' do
        visit '/applications/1'
        save_and_open_page
        expect(page).to have_content(@application1.name)
        expect(page).to have_content(@application1.address)
        expect(page).to have_content(@application1.description)
        expect(page).to have_content(@application1.all_pets.name)
        expect(page).to have_content(@application1.status)
      end
    end
  end
end
