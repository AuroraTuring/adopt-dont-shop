class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pets = Pet.search(params[:pet_name]) if params[:pet_name]
  end

  def new; end

  def create
    @application = Application.new({ name: params[:name], address: params[:address],
                                     city: params[:city], state: params[:state], zip: params[:zip],
                                     description: params[:description], status: 'In Progress' })
    if @application.save
      redirect_to "/applications/#{@application.id}"
    else
      redirect_to '/applications/new'
      flash[:alert] = "Error: #{error_message(@application.errors)}"
    end
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(application_params)
      redirect_to "/applications/#{@application.id}"
    else
      redirect_to "/applications/#{@application.id}"
      flash[:alert] = "Error: #{error_message(shelter.errors)}"
    end
  end

  private

  def application_params
    params.permit(:id, :name, :address, :description, :status)
  end
end
