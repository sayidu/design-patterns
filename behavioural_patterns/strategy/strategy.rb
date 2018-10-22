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
order = Order.new(CustomOrder.new, burger_meal: 'fries with chips')
order.generate_order

order = Order.new(StandardOrder.new)
order.generate_order
