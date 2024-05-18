require 'rails_helper'

RSpec.describe 'applications show page' do
  before(:each) do
    @shelter1 = Shelter.create!(foster_program: true, name: 'Whimsy Whiskers', city: 'Denver', rank: 42)
    @pet1 = @shelter1.pets.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true)
    @application1 = Application.create!(name: 'John Doe', address: '123 Elm St', city: 'Denver', state: 'CO',
                                        zip: '12345', description: 'Looking for a friendly dog', status: 'Pending')
    PetApplication.create!(pet: @pet1, application: @application1)
  end

  describe 'as a visitor' do
    describe 'when I visit an applications show page' do
      it 'then I can see their attributes' do
        visit "/applications/#{@application1.id}"

        expect(page).to have_content(@application1.name)
        expect(page).to have_content(@application1.address)
        expect(page).to have_content(@application1.state)
        expect(page).to have_content(@application1.city)
        expect(page).to have_content(@application1.zip)
        expect(page).to have_content(@application1.description)
        expect(page).to have_content(@application1.pets.name)
        expect(page).to have_content(@application1.status)
      end
    end

    describe 'add pets to application' do
      it 'has a way to add pets to an application' do
        visit "/applications/#{@application1.id}"

        expect(page).to have_content('Add a Pet to this Application')
      end

      it 'can select a pet and add it to the application' do
        visit "/applications/#{@application1.id}"

        fill_in 'pet_name', with: 'Buddy'

        click_button 'Add Pet'

        expect(page).to have_content(@application1.pets.name)

        # As a visitor
        # When I visit an application's show page
        # And that application has not been submitted,
        # Then I see a section on the page to "Add a Pet to this Application"
        # In that section I see an input where I can search for Pets by name
        # When I fill in this field with a Pet's name
        # And I click submit,
        # Then I am taken back to the application show page
        # And under the search bar I see any Pet whose name matches my search
      end
    end
  end
end
