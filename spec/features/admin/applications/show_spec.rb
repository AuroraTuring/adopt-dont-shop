require 'rails_helper'

RSpec.describe 'application show' do
  before do
    @shelter1 = Shelter.create!(foster_program: true, name: 'Whimsy Whiskers', city: 'Denver', rank: 42)
    @pet1 = @shelter1.pets.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true)
    @application1 = Application.create!(name: 'John Doe', address: '123 Elm St', city: 'Denver', state: 'CO',
                                        zip: '12345', description: 'Looking for a friendly dog', status: 'In Progress')
    PetApplication.create!(pet: @pet1, application: @application1)
  end

  describe 'as a visitor' do
    it 'there is a button to reject an application' do
      visit "/admin/applications/#{@application1.id}"

      expect(page).to have_content("Reject #{@pet1.name}")
    end

    it 'when a pet is rejected from an application there is a status of rejected and button to reject is gone' do
      visit "/admin/applications/#{@application1.id}"
      expect(page).to_not have_content('Rejected')
      click_button "Reject #{@pet1.name}"

      expect(page).to have_content('Rejected')
    end
  end
end
# As a visitor
# When I visit an admin application show page ('/admin/applications/:id')
# For every pet that the application is for, I see a button to reject the application for that specific pet
# When I click that button
# Then I'm taken back to the admin application show page
# And next to the pet that I rejected, I do not see a button to approve or reject this pet
# And instead I see an indicator next to the pet that they have been rejected
