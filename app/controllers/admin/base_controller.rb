# app/controllers/admin/base_controller.rb
class Admin::BaseController < ApplicationController
    before_action :authenticate_admin!

    private

    def authenticate_admin!
        redirect_to root_path, alert: 'Not authorized.' unless current_user&.admin?
    end
end
