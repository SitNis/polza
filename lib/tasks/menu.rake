require 'yaml'
require 'database_cleaner'

namespace :menu do
  task :fill => :environment do
    DatabaseCleaner.clean_with(:truncation)

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
