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

require 'test_helper'

class CompanyUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
