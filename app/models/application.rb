# == Schema Information
#
# Table name: applications
#
#  id               :integer          not null, primary key
#  owner_company_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Application < ActiveRecord::Base
  belongs_to :owner_company, class_name: "Company"
  
  has_many :accepted_invitations, -> { accepted }, as: :invitable, class_name: "Invitation"
  has_many :invited_users, through: :accepted_invitations, class_name: "User", source: :converted_user
end
