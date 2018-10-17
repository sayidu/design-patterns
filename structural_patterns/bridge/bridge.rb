class Light
  def initialize(switch: Switch.new)
    @switch = switch
  end

  def toggle_power
    default = 'Power Down'
    if switch.on? == default
      switch.on?
    else
      switch.off?
    end
  end

  protected

  attr_accessor :switch
end

class Switch
  def on?
    'Power Up'
  end

  def off?
    'Power Down'
  end
end
