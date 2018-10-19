require 'pry'
class Water
  attr_accessor :bottle_no

  def initialize(bottle_no)
    @bottle_no = bottle_no
  end

  def description
    'Water'
  end
end

class StillWater < Water
  def description
    puts "Still Water #{bottle_no} made at the creeks"
  end
end

class SparklingWater < Water
  def description
    puts "Sparkling Water #{bottle_no} made at the creeks"
  end
end

class WaterFactory
  def create_still_bottles(bottle_no)
    StillWater.new(bottle_no)
  end

  def create_sparkling_bottles(bottle_no)
    SparklingWater.new(bottle_no)
  end
end

class BeverageCompany
  def initialize(beverage_factory, no_of_bottles)
    @beverage_factory = beverage_factory

    @bottles = []
    no_of_bottles.times do |bottle_no|
      bottle = @beverage_factory.create_still_bottles(
        "#{bottle_no + 1} produced"
      )
      @bottles << bottle
    end
  end

  def show_beverage_description
    @bottles.each(&:description)
  end
end

# [Run]
beverage_company = BeverageCompany.new(WaterFactory.new, 5)
beverage_company.show_beverage_description
