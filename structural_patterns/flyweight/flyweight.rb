require 'pry'
class Number
  attr_reader :number

  def initialize(number)
    @number = number
  end
end

class NumberFactory
  def initialize
    @number_range = {}
  end

  def find_number(number)
    if @number_range.key?(number)
      number = @number_range[number]
    else
      number = create_number(number)
      @number_range[number] = number
    end
    number
  end

  def numbers_total
    @number_range.size
  end

  private

  def create_number(number)
    Number.new(number)
  end
end

class TelephoneNumber
  attr_reader :number_factory

  def initialize
    @number_factory = NumberFactory.new
    @tel_number = []
  end

  def add_number(number)
    number = @number_factory.find_number(number)
    @tel_number << number
  end

  def view_phone_number
    @tel_number.map(&:number).join
  end
end

# [Run]
telephone_number = TelephoneNumber.new
telephone_number.add_number(0)
telephone_number.add_number(9)
telephone_number.add_number(0)
telephone_number.add_number(2)
telephone_number.add_number(2)
telephone_number.add_number(1)
telephone_number.add_number(0)
telephone_number.add_number(9)
telephone_number.add_number(7)

puts telephone_number.view_phone_number
puts telephone_number.number_factory.numbers_total
