require "rails_helper"

RSpec.describe "applications show page" do
  # As a visitor
  # When I visit an applications show page
  # Then I can see their attributes
  describe "as a visitor" do
    describe "when I visit an applications show page" do
      it "then I can see their attributes" do
        visit "/:id"

        expect(page).to have_content(application.name)
        expect(page).to have_content(application.address)
        expect(page).to have_content(application.description)
        expect(page).to have_content(application.all_pets)
        expect(page).to have_content(application.status)
      end
    end
  end
end
