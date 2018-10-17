require 'pry'

class Chapter
  attr_accessor :name, :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def pages
    1
  end
end

class IntroductoryChapter < Chapter
  def initialize
    super('The Beginning')
  end

  def pages
    10
  end
end

class ClosingChapter < Chapter
  def initialize
    super('The End')
  end

  def pages
    5
  end
end

class Book < Chapter
  def initialize(name)
    super(name)
    @chapters = []
  end

  def add_a_chapter(chapter)
    @chapters << chapter
    chapter.parent = self
  end

  def delete_a_chapter
    @chapters.delete(chapter)
    chapter.delete = nil
  end

  def total_pages
    @chapters
  end
end

class CartoonBook < Book
  def initialize
    super('The Cartoon Book')
    add_a_chapter(IntroductoryChapter.new)
    add_a_chapter(ClosingChapter.new)
  end
end

# [Run]
cartoon_book = CartoonBook.new
puts cartoon_book
