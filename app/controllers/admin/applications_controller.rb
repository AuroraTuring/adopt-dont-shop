class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pet_applications = PetApplication.by_application_id(@application.id)
    @pets = Pet.search(params[:pet_name]) if params[:pet_name]
  end

  def update
    @application = Application.find(params[:id])
    @pet_application = @application.pet_applications.find_by(params[:pet_id])
    if @pet_application.update(pet_application_params)
      redirect_to "/admin/applications/#{@application.id}"
    else
      redirect_to "/admin/applications/#{@application.id}"
      flash[:alert] = "Error: #{error_message(@pet_application.errors)}"
    end
  end

  def pet_application_params
    params.permit(:id, :application_id, :pet_id, :status)
  end
end
