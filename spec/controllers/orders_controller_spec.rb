require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe "GET /index" do
    let(:ingredients) { create_list(:ingredient, 3) }
    let(:dish_1) { create(:dish, name: 'dish_1', ingredients: [ingredients[0], ingredients[1]]) }
    let(:dish_2) { create(:dish, name: 'dish_2', ingredients: [ingredients[0], ingredients[2]]) }
    let!(:order_1) { create(:order, dishes: [dish_1]) }
    let!(:order_2) { create(:order, dishes: [dish_1, dish_2]) }

    before { get :index }

    it 'renders json index view' do
      expected = DishFetcherService.fetch_number_of_ordered_dishes.to_json
      expect(response.body).to eq(expected)
    end
  end

  describe "POST /create" do
    let(:ingredients) { create_list(:ingredient, 3) }
    let!(:dish_1) { create(:dish, name: 'dish_1', ingredients: [ingredients[0], ingredients[1]]) }
    let!(:dish_2) { create(:dish, name: 'dish_2', ingredients: [ingredients[0], ingredients[2]]) }

    it 'saves a new order in the database' do
      expect { post :create, params: { :order => { ingredient_ids: [''] } } }.to change(Order, :count).by(1)
    end

    it 'saves a new order without rejected ingredients' do
      post :create, params: { :order => { ingredient_ids: [ingredients[1].id] } }
      expect(Order.last.dishes.count).to eq(1)
    end

    it "doesn't save order without dishes" do
      expect {
        post :create, params: { :order => { ingredient_ids: [ingredients[0].id] } }
      }.not_to change(Order, :count)
    end
  end
end
