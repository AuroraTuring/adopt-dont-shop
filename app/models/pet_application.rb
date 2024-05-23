class PetApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet
  validates :pet_id, presence: true
  validates :application_id, presence: true

  def self.by_application_id(application_id)
    where(:id == application_id)
  end
end
