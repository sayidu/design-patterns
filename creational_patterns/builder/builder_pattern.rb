# [Role] Abstract Builder
class MenuBuilder
  attr_accessor :menu

  def initialize
    @menu = Menu.new
  end

  def build_breakfast
    raise NotImplementedError,
          "#{classname} does not implement build_breakfast()"
  end

  def build_lunch
    raise NotImplementedError,
          "#{classname} does not implement build_lunch()"
  end

  def build_dinner
    raise NotImplementedError,
          "#{classname} does not implement build_dinner()"
  end
end

# [Role] Concrete Builder
class VeganMenuBuilder < MenuBuilder
  def build_breakfast
    @menu.breakfast = 'Vegan Breakfast with no animal products'
  end

  def build_lunch
    @menu.lunch = 'Vegan Lunch with no animal products'
  end

  def build_dinner
    @menu.dinner = 'Vegan Dinner with no animal products'
  end
end

# [Role] Concrete Builder
class OmnivoreMenuBuilder < MenuBuilder
  def build_breakfast
    @menu.breakfast = 'Omnivore Breakfast with animal products'
  end

  def build_lunch
    @menu.lunch = 'Omnivore Lunch with animal products'
  end

  def build_dinner
    @menu.dinner = 'Omnivore Dinner with animal products'
  end
end

# [Role] Director
class VeganMenu
  def initialize(builder)
    @builder = builder
  end

  def create_menu
    @builder.build_breakfast
    @builder.build_lunch
    @builder.build_dinner
  end
end

# [Role] Director
class OmnivoreMenu
  def initialize(builder)
    @builder = builder
  end

  def create_menu
    @builder.build_breakfast
    @builder.build_lunch
    @builder.build_dinner
  end
end

# [Role] Product
class Menu
  attr_accessor :breakfast, :lunch, :dinner

  def to_s
    [breakfast, lunch, dinner].join(', ')
  end
end

# [Role] Client
class Dietician
  def create_vegan_meal(menu_curator)
    vegan_meal = VeganMenu.new(menu_curator)
    vegan_meal.create_menu
    menu_curator.menu.to_s
  end

  def create_omnivore_meal(menu_curator)
    omnivore_meal = OmnivoreMenu.new(menu_curator)
    omnivore_meal.create_menu
    menu_curator.menu.to_s
  end
end

# [Run]
menu_curator = VeganMenuBuilder.new
menu_created = Dietician.new.create_vegan_meal(menu_curator)
