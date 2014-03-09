module Scrapers
  class Base
    def self.mechanize
      @mechanize ||= Mechanize.new do |agent|
        agent.user_agent_alias = 'Mac Safari'
      end
    end
  end
end
