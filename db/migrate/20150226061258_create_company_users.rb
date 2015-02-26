class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.references :company, index: true
      t.references :user, index: true
      t.string :acl

      t.datetime :effective
      t.datetime :expire

      t.timestamps
    end
  end
end
