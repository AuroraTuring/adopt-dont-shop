class AddAllPetsToApplications < ActiveRecord::Migration[7.1]
  def change
    add_reference :applications, :pets, foreign_key: true
  end
end
