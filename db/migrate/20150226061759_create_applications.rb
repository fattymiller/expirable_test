class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :owner_company_id

      t.timestamps
    end
    add_index :applications, :owner_company_id
  end
end
