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

require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
