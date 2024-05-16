class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
