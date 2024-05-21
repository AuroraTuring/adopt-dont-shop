class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    return unless params[:pet_name]

    @pets = Pet.search(params[:pet_name])
  end

  def new
    # @application = Application.new
  end

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
end
