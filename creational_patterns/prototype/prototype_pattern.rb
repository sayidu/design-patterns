class CartItem
  attr_accessor :name, :price, :charged

  def initialize(name, price)
    @name = name
    @price = price
  end

  def charge
    @state = 'charged'
  end
end

class Cart
  attr_accessor :cart_item_collection

  def initialize
    @cart_item_collection = {}
  end

  def create_cart(cart_item)
    cart_prototype = cart_item_collection[cart_item]
    raise 'unsupported cart itme' unless cart_prototype

    cart = cart_prototype.clone
    cart.charge
    cart
  end
end

# [Run]
cart = Cart.new
phone_prototype = CartItem.new('phone', 200)
cart.cart_item_collection['phone'] = phone_prototype
cart.create_cart('phone')
