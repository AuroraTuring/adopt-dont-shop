class PetApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  def self.by_application_id(application_id)
    where(:id == application_id)
  end
end
