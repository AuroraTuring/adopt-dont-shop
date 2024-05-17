
class ApplicationsController < ApplicationController
  def show
    @application = Applications.find(params[:id])
  end
end
