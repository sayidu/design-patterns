class School
  def initialize
    @titile = 'School Registration'
  end

  def enroll
    apply_for_class
    pay_fees
    show_up
  end

  def apply_for_class
    raise NotImplementedError, 'Implement: apply_for_class'
  end

  def pay_fees
    raise NotImplementedError, 'Implement: pay_fees'
  end

  def show_up
    "That's up to you"
  end
end

class University < School
  def apply_for_class
    puts 'Applied for a university class'
  end

  def pay_fees
    puts 'Paid: 2300'
  end
end

class HighSchool < School
  def apply_for_class
    puts 'Applied for a high school class'
  end

  def pay_fees
    puts 'Paid: 200'
  end
end

# [Run]
HighSchool.new.apply_for_class
University.new.apply_for_class
