class QuestionHandler
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def process_request(request)
    if accept_request(request)
      nil
    elsif @successor
      @successor.process_request(request)
    else
      fail_request(request)
    end
  end

  def fail_request(request)
    puts "The question '#{request}' could not be answered."
  end

  def accept_request(_request)
    raise '#accept_request method must be implemented.'
  end
end

class StarWarsQuestionHandler < QuestionHandler
  def accept_request(request)
    if request.include?('Star Wars')
      answer_question(request)
      true
    else
      false
    end
  end

  def answer_question(request)
    puts "answering a Star Wars related question: '#{request}'"
  end
end

class HarryPotterQuestionHandler < QuestionHandler
  def accept_request(request)
    if request.include?('Harry Potter')
      answer_question(request)
      true
    else
      false
    end
  end

  def answer_question(request)
    puts "answering a Harry Potter related question: '#{request}'"
  end
end

class LordOfTheRingsQuestionHandler < QuestionHandler
  def accept_request(request)
    if request.include?('Lord of the Rings')
      answer_question(request)
      true
    else
      false
    end
  end

  def answer_question(request)
    puts "answering a Lord of the Rings related question: '#{request}'"
  end
end

# [Run]
chain_of_responsibility = HarryPotterQuestionHandler.new(
  StarWarsQuestionHandler.new(
    LordOfTheRingsQuestionHandler.new
  )
)

chain_of_responsibility.process_request(
  'What is the longest wand in Harry Potter?'
)
