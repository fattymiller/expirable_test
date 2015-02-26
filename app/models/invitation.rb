# == Schema Information
#
# Table name: invitations
#
#  id                :integer          not null, primary key
#  converted_user_id :integer
#  deleted_at        :datetime
#  invitable_type    :string
#  invitable_id      :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Invitation < ActiveRecord::Base
  scope :current, -> { where(deleted_at: nil) }
  
  scope :accepted, -> { current.where.not(converted_user_id: nil) }
  scope :application, -> { current.where(invitable_type: "Application") }

  belongs_to :invitable, polymorphic: true
  belongs_to :converted_user, class_name: "User"

end
