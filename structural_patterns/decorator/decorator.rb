class School
  def name
    'Decorator School'
  end

  def fees
    200
  end
end

class OptionalClass
  def initialize(school)
    @school = school
  end

  def fees
    @school.fees + 50
  end
end

# [Run]
school = School.new
opt_class = OptionalClass.new(school)
puts opt_class.fees
