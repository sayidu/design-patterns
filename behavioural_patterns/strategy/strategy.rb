class Order
  def initialize(order_generator, burger_meal: 'fries')
    @order_generator = order_generator
    @burger_meal = burger_meal
  end

  def generate_order
    @order_generator.generate_order(@burger_meal)
  end
end

class StandardOrder
  def generate_order(_burger_meal)
    puts 'Your standard burger order for: fries is ready'
  end
end

class CustomOrder
  def generate_order(burger_meal)
    puts "Your custom burger order: #{burger_meal} is ready"
  end
end

# [Run]
custom_order = CustomOrder.new
order = Order.new(custom_order, burger_meal: 'fries with chips')
order.generate_order

standard_order = StandardOrder.new
order = Order.new(standard_order)
order.generate_order
