require 'yaml'

namespace :db do
  task :seed => :environment do
    menu = YAML.load_file('lib/files/menu.yml')

    menu['ingredients'].each do |ingredient|
      Ingredient.create(name: ingredient)
    end

    menu['dishes'].each do |dish|
      ingredients = Ingredient.where('name IN (?)', dish['ingredients'])

      Dish.create(name: dish['name'], ingredients: ingredients)
    end
  end
end
