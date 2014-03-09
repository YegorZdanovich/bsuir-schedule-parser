class Group
  attr_reader :number

  def initialize(number)
    raise ArgumentError if invalid_group_number(number)
    @number = number
  end

  def teachers
    @teachers ||= Scrapers::Teacher.scrape(@number).uniq.map {|name| Teacher.new(name) }
  end

  protected

  def invalid_group_number(number)
    number.nil? || number.empty? || !number.match(/\d{6}/)
  end

end
