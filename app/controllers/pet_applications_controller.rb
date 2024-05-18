class PetApplicationsController < ApplicationController
  def create
    binding.pry
    @application = Application.find
    binding.pry
    @pet = Pet.find(params[:pet_name])
    @pet_application = PetApplication.new({ id: params[:pet_application_id], application_id: params[:application_id],
                                            pet_id: params[:pet_id] })
    @pet_application.save
    redirect_to "/#{@application}/show"
  end

  def new; end
end
