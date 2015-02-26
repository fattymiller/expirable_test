# == Schema Information
#
# Table name: company_users
#
#  id         :integer          not null, primary key
#  company_id :integer
#  user_id    :integer
#  acl        :string
#  effective  :datetime
#  expire     :datetime
#  created_at :datetime
#  updated_at :datetime
#

class CompanyUser < ActiveRecord::Base
  include Expirable
  
  scope :admin, -> { current.where(acl: "admin") }
  scope :manager, -> { current.where(acl: "manager") }
  scope :staff, -> { current.where(acl: "staff") }
  
  belongs_to :company
  belongs_to :user
end
