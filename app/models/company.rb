# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Company < ActiveRecord::Base
  has_many :company_administrators, -> { admin }, class_name: "CompanyUser"
  has_many :company_managers, -> { manager }, class_name: "CompanyUser"
  has_many :company_staff, -> { staff }, class_name: "CompanyUser"
  has_many :company_users, -> { current }

  has_many :administrators, through: :company_administrators, class_name: "User", source: :user
  has_many :managers, through: :company_managers, class_name: "User", source: :user
  has_many :staff, through: :company_staff, class_name: "User", source: :user
  has_many :users, through: :company_users

  has_many :owned_applications, class_name: "Application", foreign_key: "owner_company_id"
end
