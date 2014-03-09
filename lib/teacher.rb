class Teacher
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def comments
    @comments ||= Scrapers::Comments.scrape(self)
  end
end
