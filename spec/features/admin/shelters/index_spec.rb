require 'rails_helper'

RSpec.describe 'admin shelter index' do
  before(:each) do
    @shelter1 = Shelter.create!(foster_program: true, name: 'Whimsy Whiskers', city: 'Denver', rank: 42)
    @shelter2 = Shelter.create!(foster_program: true, name: 'Meow Wows', city: 'New York', rank: 42)
    @shelter3 = Shelter.create!(foster_program: false, name: 'Sandy Meows', city: 'Miami', rank: 42)

    @application1 = Application.create!(name: 'John Doe', address: '123 Elm St', city: 'Miami', state: 'FL', zip: '89494',
                                        description: 'Looking for a friendly dog', status: 'Pending')
    @application2 = Application.create!(name: 'Jane Smith', address: '456 Maple Ave', city: 'Denver', state: 'CO',
                                        zip: '12321', description: 'Interested in a cat', status: 'Pending')
  end

  describe 'as a visitor' do
    describe 'when I visit the admin shelter index ("/admin/shelters")' do
      it 'then I see all Shelters in the system listed in reverse alphabetical order by name' do
        visit '/admin/shelters'

        within '#shelter-0' do
          expect(page).to have_content('Whimsy Whiskers')
        end

        within '#shelter-1' do
          expect(page).to have_content('Sandy Meows')
        end

        within '#shelter-2' do
          expect(page).to have_content('Meow Wows')
        end
      end

      it 'will display a section for "Shelters with Pending Applications"' do
        visit '/admin/shelters'

        expect(page).to have_content("Shelters with Pending Applications")
      end

      it 'will show the name of every shelter that has a pending application' do
        visit '/admin/shelters'

        expect(page).to have_content(@shelter1.name)
        expect(page).to have_content(@shelter2.name)
      end
    end
  end
end
