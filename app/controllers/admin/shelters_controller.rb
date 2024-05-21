class Admin::SheltersController < ApplicationController
  def index
    @shelters = Shelter.reverse_alphabetical_shelters
  end
end
