require 'rails_helper'

RSpec.describe 'application show' do
  before do
    @shelter1 = Shelter.create!(foster_program: true, name: 'Whimsy Whiskers', city: 'Denver', rank: 42)
    @pet1 = @shelter1.pets.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true)
    @application1 = Application.create!(name: 'John Doe', address: '123 Elm St', city: 'Denver', state: 'CO',
                                        zip: '12345', description: 'Looking for a friendly dog', status: 'In Progress')
    PetApplication.create!(pet: @pet1, application: @application1, status: :Pending)
  end

  describe 'as a visitor' do
    it 'there is a button to reject an application' do
      visit "/admin/applications/#{@application1.id}"

      expect(page).to have_content("Reject")
    end

    it 'when a pet is rejected from an application there is a status of rejected and button to reject is gone' do
      visit "/admin/applications/#{@application1.id}"
      
      expect(page).to_not have_content('Rejected')
      click_button 'Reject'
      
      expect(page).to have_content('Rejected')
    end

    it 'there is a button to approve an application' do
      visit "/admin/applications/#{@application1.id}"

      expect(page).to have_content("Approve")
    end

    it 'when a pet is Approved on an application there is a status of Approved and button to Approve is gone' do
      visit "/admin/applications/#{@application1.id}"
      
      expect(page).to_not have_content('Approved')
      click_button 'Approve'
      
      expect(page).to have_content('Approved')
    end
  end
end
# Then I'm taken back to the admin application show page
# And next to the pet that I rejected, I do not see a button to approve or reject this pet
# And instead I see an indicator next to the pet that they have been rejected
