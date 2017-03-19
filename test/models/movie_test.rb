# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  starring    :string
#  price       :float
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stock       :integer
#

require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
