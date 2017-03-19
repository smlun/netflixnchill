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

require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:starring) }
    it { should validate_presence_of(:price) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:description) }
  end

  describe Movie do
    it { should have_many(:orders) }
  end

end
