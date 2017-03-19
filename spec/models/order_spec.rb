# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#

require 'rails_helper'

RSpec.describe Order, type: :model do

  describe Order do
    it { should belong_to(:movie) }
  end

end
