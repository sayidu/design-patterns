class Sky
  def self.instance
    @instance ||= new
  end

  private_class_method :new
end

class Earth
  def create_sky
    Sky.instance
  end
end
