require 'rails_helper'

RSpec.describe 'applications show page' do
  before(:each) do
    @shelter1 = Shelter.create!(foster_program: true, name: 'Whimsy Whiskers', city: 'Denver', rank: 42)
    @pet1 = @shelter1.pets.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true)
    @application1 = Application.create!(name: 'John Doe', address: '123 Elm St', city: 'Denver', state: 'CO',
                                        zip: '12345', description: 'Looking for a friendly dog', status: 'In Progress')
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

      it 'can search for a pet' do
        visit "/applications/#{@application1.id}"

        fill_in 'pet_name', with: 'Buddy'

        click_button 'Search'

        expect(page).to have_content('Buddy')
      end

      it 'has a button and can add each pet to application' do
        visit "/applications/#{@application1.id}"

        fill_in 'pet_name', with: 'Buddy'

        click_button 'Search'

        expect(page).to have_button('Adopt This Pet')
        click_button 'Adopt This Pet'
        expect(page).to have_content('All Pets: Buddy')
      end
    end

    describe 'completing an application' do
      it 'has an option to submit the application if there are pets' do
        visit "/applications/#{@application1.id}"

        fill_in 'pet_name', with: 'Buddy'

        click_button 'Search'
        click_button 'Adopt This Pet'
        fill_in 'description', with: 'I like Turtles'

        expect(page).to have_button('Submit')

        click_button 'Submit'
        # save_and_open_page
        expect(page).to have_content('Description: I like Turtles')
        expect(current_path).to eq("/applications/#{@application1.id}")
        expect(page).to have_content('Pending')
      end
    end
  end
end

# And I see an indicator that the application is "Pending"
# And I see all the pets that I want to adopt
# And I do not see a section to add more pets to this application
