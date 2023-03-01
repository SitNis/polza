require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should have_and_belong_to_many(:ingredients) }
  it { should have_and_belong_to_many(:orders) }

  it { should validate_presence_of :name }
end
