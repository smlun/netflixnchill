require 'rails_helper'

RSpec.describe Order, type: :model do

  describe Order do
    it { should belong_to(:movie) }
  end

end
