class OrdersController < ApplicationController
  def new
    @ingredients = Ingredient.all

    @order = Order.new
  end

  def create
    dishes = DishFetcherService.fetch(order_params[:ingredient_ids])

    @order = Order.create()
    @order.dishes << dishes

    if @order.save
      redirect_to menu_index_path
    end
  end

  private

  def order_params
    params.require(:order).permit(ingredient_ids: [])
  end
end
