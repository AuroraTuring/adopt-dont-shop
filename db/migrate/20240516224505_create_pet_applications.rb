class CreatePetApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_applications do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
