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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
