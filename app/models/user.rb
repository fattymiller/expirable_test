# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  effective  :datetime
#  expire     :datetime
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  include Expirable
  
  has_many :company_administrators, -> { admin }, class_name: "CompanyUser"
  has_many :company_managers, -> { manager }, class_name: "CompanyUser"
  has_many :company_staff, -> { staff }, class_name: "CompanyUser"
  has_many :company_users, -> { current }, dependent: :destroy
  
  has_many :administered_companies, through: :company_administrators, class_name: "Company", source: :company
  has_many :managed_companies, through: :company_managers, class_name: "Company", source: :company
  has_many :employed_companies, through: :company_staff, class_name: "Company", source: :company
  has_many :companies, through: :company_users
  
  has_many :application_invitations, -> { application }, class_name: "Invitation", foreign_key: "converted_user_id"
  has_many :invited_applications, class_name: "Application", through: :application_invitations, source: :invitable, source_type: "Application"
end
