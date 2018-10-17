class CarFactory
  def self.create_preferred_car(type)
    case type
    when 'sports'
      SportsCar.new
    when 'electronic'
      ElectronicCar.new
    else
      RegularCar.new
    end
  end
end

class SportsCar
  def drive
    'Really fast engine'
  end
end

class ElectronicCar
  def drive
    'Really efficient engine'
  end
end

class RegularCar
  def drive
    'Regular engine'
  end
end

class CarCompany
  def initialize(type)
    @car = CarFactory.create_preferred_car(type)
  end

  def start_car
    @car.drive
  end
end

# [Run]
sport_car = CarCompany.new('sports')
sport_car.start_car
