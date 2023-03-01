RSpec.describe DishFetcherService do
  let(:ingredients) { create_list(:ingredient, 3) }
  let!(:dish_1) { create(:dish, name: 'dish_1', ingredients: [ingredients[0], ingredients[1]]) }
  let!(:dish_2) { create(:dish, name: 'dish_2', ingredients: [ingredients[0], ingredients[2]]) }
  let!(:order_1) { create(:order, dishes: [dish_1, dish_2]) }
  let!(:order_2) { create(:order, dishes: [dish_1]) }

  it 'fetch dishes without rejected ingredients' do
    expect(described_class.fetch_dishes_to_order([ingredients[1].id])).to eq([dish_2])
  end

  it 'fetch number of ordered dishes' do
    expected = [{ name: 'dish_1', count: 2 }, { name: 'dish_2', count: 1 }]
    expect(described_class.fetch_number_of_ordered_dishes).to eq(expected)
  end
end
