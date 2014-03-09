module Scrapers
  class Comments < Base
    class << self
      URL="http://bsuir-helper.ru"

      def scrape(teacher)
        page = mechanize.get("#{URL}/lectors")

        all_names = page.parser.css('.views-row a')
        normalized_name = teacher.name.split('.').first

        link = all_names.find {|l| l.text.include?(normalized_name) }

        return [] unless link

        scrape_comments(link)
      end

      def scrape_comments(link)
        page = mechanize.get("#{URL}#{link.attributes['href'].value}")
        page.parser.css('.comment .content p').map(&:text)
      end
    end
  end
end
