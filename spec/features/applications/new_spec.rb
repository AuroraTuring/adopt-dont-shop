	# As a visitor
	# When I visit the pet index page
	# Then I see a link to "Start an Application"
	# When I click this link
	# Then I am taken to the new application page where I see a form
	# When I fill in this form with my:
	#   - Name
	#   - Street Address
	#   - City
	#   - State
	#   - Zip Code
	#   - Description of why I would make a good home
	# And I click submit
	# Then I am taken to the new application's show page
	# And I see my Name, address information, and description of why I would make a good home
	# And I see an indicator that this application is "In Progress"

	require 'rails_helper'

	RSpec.describe 'application new page' do
		before(:each) do
			@shelter1 = Shelter.create!(foster_program: true, name: 'Whimsy Whiskers', city: 'Denver', rank: 42)
			# @pet1 = Pet.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true, shelter: @shelter1)
			@pet1 = @shelter1.pets.create!(name: 'Buddy', breed: 'Golden Retriever', age: 3, adoptable: true)
			@application1 = Application.create!(name: 'John Doe', address: '123 Elm St', description: 'Looking for a friendly dog', status: 'Pending')
			PetApplication.create!(pet: @pet1, application: @application1)
		end

		describe 'as a visitor' do
			describe 'when I visit the pet index page' do
				it 'then I see a link to "Start an Application"' do
					
					visit "/pets"
					
					save_and_open_page

					expect(page).to have_link("Start an Application")
				end

				it 'when I click the link "Start an Applicaiton" I am taken to the new application page' do
					
					visit "/pets"

					click_link "Start an Application"

					expect(current_path).to eq("/applications/#{@application1.id}/new")
				end
			end

			describe 'when I visit the application new page' do
				fill_in "application[name]", with: "Billy"
				fill_in "application[address]", with: "1234 Example Street"
				fill_in "application[city]", with: "Fake City"
				fill_in "application[state]", with: "Faketucky"
				fill_in "application[]", with: "Artemy"

				#   - Name
				#   - Street Address
				#   - City
				#   - State
				#   - Zip Code
				#   - Description of why I would make a good home
				# And I click submit
				# Then I am taken to the new application's show page
				# And I see my Name, address information, and description of why I would make a good home
				# And I see an indicator that this application is "In Progress"
			end
		end
	end
end