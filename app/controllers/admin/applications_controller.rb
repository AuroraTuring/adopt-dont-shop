class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pets = Pet.search(params[:pet_name]) if params[:pet_name]
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(application_params)
      redirect_to "/admin/applications/#{@application.id}"
    else
      redirect_to "/admin/applications/#{@application.id}"
      flash[:alert] = "Error: #{error_message(shelter.errors)}"
    end
  end
end
