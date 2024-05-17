
class PetsController < ApplicationController
  def show
    @applications = Applications.find(params[:id])
  end
end
