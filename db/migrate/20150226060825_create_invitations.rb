class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :converted_user_id
      
      t.datetime :deleted_at
      
      t.string :invitable_type
      t.integer :invitable_id

      t.timestamps
    end
  end
end
