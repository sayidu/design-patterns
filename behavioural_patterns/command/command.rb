class Recipe
  attr_reader :cooking_step

  def initialize(cooking_step)
    @cooking_step = cooking_step
  end

  def prepare_meal
    @cooking_step.execute
  end
end

# Encapsulates a request as an object
class BoilingService
  attr_reader :cooking_item, :boiler

  def initialize(cooking_item)
    @cooking_item = cooking_item
    @boiler = Boiler.new
  end

  def execute
    boiler.boil(cooking_item)
  end
end

class FryingService
  attr_reader :cooking_item, :fryer

  def initialize(cooking_item)
    @cooking_item = cooking_item
    @fryer = Fryer.new
  end

  def execute
    fryer.fry(cooking_item)
  end
end

class Boiler
  def boil(cooking_item)
    puts "Boiling: #{cooking_item}"
  end
end

class Fryer
  def fry(cooking_item)
    puts "Frying: #{cooking_item}"
  end
end

# Parameterize other objects with different requests
class Chef
  attr_reader :cooking_step1, :cooking_step2

  def initialize(cooking_step1, cooking_step2)
    @cooking_step1 = Recipe.new(cooking_step1)
    @cooking_step2 = Recipe.new(cooking_step2)
  end
end

# [Run]
boiling = BoilingService.new('rice')
frying = FryingService.new('eggs')
chef = Chef.new(boiling, frying)
# queue or log requests
puts chef.cooking_step1.prepare_meal
puts chef.cooking_step2.prepare_meal
