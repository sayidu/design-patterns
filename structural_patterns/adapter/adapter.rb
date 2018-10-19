class USBAPort
  attr_accessor :max_current, :transfer_rate

  def initialize
    @max_current = nil
    @transfer_rate = nil
  end

  def plug(wire)
    self.max_current = wire.usba_max_current
    self.transfer_rate = wire.usba_transfer_rate
  end
end

class USBCAdapter
  attr_accessor :usb_c_wire

  def initialize(usb_c_wire)
    @usb_c_wire = usb_c_wire
  end

  def usba_max_current
    puts "Ignore USBC Max Current: #{usb_c_wire.max_current}"
    100
  end

  def usba_transfer_rate
    puts "Ignore USBC Transfer Rate: #{usb_c_wire.transfer_rate}"
    '5GBPS'
  end
end

class USBCWire
  def max_current
    120
  end

  def transfer_rate
    '10GBPS'
  end
end

# [Run]
available_port = USBAPort.new
usb_c_wire = USBCWire.new
usbc_to_usba_adapter = USBCAdapter.new(usb_c_wire)
available_port.plug(usbc_to_usba_adapter)
