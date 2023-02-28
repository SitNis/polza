class MenuController < ApplicationController
  def index
    @ingredients = Ingredient.all
    
    render @ingredients
  end
end
