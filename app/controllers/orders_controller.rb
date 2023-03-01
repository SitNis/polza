class OrdersController < ApplicationController
  def index
    @dishes = DishFetcherService.fetch_number_of_ordered_dishes

    render json: @dishes
  end

  def new
    @order = Order.new
  end

  def create
    dishes = DishFetcherService.fetch_dishes_to_order(order_params[:ingredient_ids])

    @order = Order.create
    @order.dishes << dishes

    if @order.save
      redirect_to menu_index_path
    else
      redirect_to menu_index_path, notice: "Sorry! We can't pick any dish for you"
    end
  end

  private

  def order_params
    params.require(:order).permit(ingredient_ids: [])
  end
end
