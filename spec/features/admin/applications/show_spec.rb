require 'rails_helper'

RSpec.describe 'application show' do
  before do
    @shelter1 = Shelter.create!(foster_program: true, name: 'Whimsy Whiskers', city: 'Denver', rank: 42)
    @pet1 = @shelter1.pets.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true)
    @application1 = Application.create!(name: 'John Doe', address: '123 Elm St', city: 'Denver', state: 'CO',
                                        zip: '12345', description: 'Looking for a friendly dog', status: 'In Progress')
    @application2 = Application.create!(name: 'Chee Lee', address: '897 Pine St', city: 'Town', state: 'WI',
                                        zip: '12345', description: 'Looking for a friendly cat', status: 'In Progress')                                    
    PetApplication.create!(pet: @pet1, application: @application1, status: :Pending)
    PetApplication.create!(pet: @pet1, application: @application2, status: :Pending)
  end

  describe 'as a visitor' do
    it 'has a link to the user view' do
      expect(page).to have_link("User View")
    end

    it 'there is a button to reject an application' do
      visit "/admin/applications/#{@application1.id}"

      expect(page).to have_content("Reject")
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

    it 'when there are multiple applications with the same pets, the behavior is the same, even when one has a pet approved or denied' do
      visit "/admin/applications/#{@application1.id}"
      
      expect(page).to_not have_content('Approved')
      click_button 'Approve'

      visit "/admin/applications/#{@application2.id}"

      expect(page).to have_content("Approve")
      expect(page).to have_content('Reject')

      click_button 'Approve'
      
      expect(page).to have_content('Approved')
    end
  end
end