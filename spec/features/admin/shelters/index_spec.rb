require 'rails_helper'

RSpec.describe 'admin shelter index' do
  before(:each) do
    @shelter1 = Shelter.create!(foster_program: true, name: "Whimsy Whiskers", city: "Denver", rank: 42)
    @shelter2 = Shelter.create!(foster_program: true, name: "Meow Wows", city: "New York", rank: 42)
    @shelter3 = Shelter.create!(foster_program: false, name: "Sandy Meows", city: "Miami", rank: 42)
  end

  # As a visitor
  # When I visit the admin shelter index ('/admin/shelters')
  # Then I see all Shelters in the system listed in reverse alphabetical order by name
  describe 'as a visitor' do
    describe 'when I visit the admin shelter index ("/admin/shelters")' do
      it 'then I see all Shelters in the system listed in reverse alphabetical order by name' do
        visit "/admin/shelters"

        within "#shelter-0" do
          expect(page).to have_content("Whimsy Whiskers")
        end

        within "#shelter-1" do
        expect(page).to have_content("Sandy Meows")
        end

        within "#shelter-2" do
        expect(page).to have_content("Meow Wows")
        end
      end
    end
  end

end
