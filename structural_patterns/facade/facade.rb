class SMSMessage
  def send_msg(text)
    puts "Sent SMS: #{text}"
  end
end

class MMSMessage
  def send_multimedia_msg(media)
    puts "Sent SMS: #{media}"
  end
end

class Message
  def regular_msg(text)
    SMSMessage.new.send_msg(text)
  end

  def fancy_msg(emoji)
    MMSMessage.new.send_multimedia_msg(emoji)
  end
end

# [Run]
msg = Message.new
msg.regular_msg('Hey, Sending you a message!')
msg.fancy_msg('Smile :)')
