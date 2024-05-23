class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_alphabetical_shelters
    @applications = Shelter.pending_shelter_applications
  end
end
