require 'rails_helper'

RSpec.describe 'application new page' do
	describe 'as a visitor' do
		describe 'when I visit the pet index page' do
			it 'then I see a link to "Start an Application"' do
				
				visit "/pets"

				expect(page).to have_link("Start an Application")
			end

			it 'when I click the link "Start an Applicaiton" I am taken to the new application page' do
				
				visit "/pets"

				click_link "Start an Application"

				expect(current_path).to eq("/applications/new")
			end
		end

		describe 'when I visit the application new page' do
			it "when I am taken to the new application page, I see a form" do

				visit "/applications/new"

				fill_in "name", with: "Billy"
				fill_in "address", with: "1234 Example Street"
				fill_in "city", with: "Fake City"
				fill_in "state", with: "Faketucky"
				fill_in "zip", with: "123654"
				fill_in "description", with: "I would be a good parent because I would."

				click_button "Submit Application" # within 'form' do find('#submit').click end
			
				expect(current_path).to eq("/applications/#{Application.last.id}")

				expect(page).to have_content("Name: Billy")
				expect(page).to have_content("Address: 1234 Example Street, Fake City, Faketucky 123654")
				expect(page).to have_content("Description: I would be a good parent because I would.")

				expect(page).to have_content("Application Status: In Progress")
			end
		end
	end
end
