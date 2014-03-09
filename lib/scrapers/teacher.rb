module Scrapers
  class Teacher < Base
    class << self
      URL="http://www.bsuir.by/psched/schedulegroup"

      def scrape(number)
        names = []

        mechanize.get("#{URL}?group=#{number}") do |page|
          names = page.parser.css("table tr td:last-child div").map(&:text).reject(&:empty?)
        end

        names

      end

    end

  end
end
