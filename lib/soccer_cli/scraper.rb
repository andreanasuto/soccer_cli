require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  def self.scraper_competition(url)
    output = []
    doc = Nokogiri::HTML(open("https://www.transfermarkt.us/serie-a/startseite/wettbewerb/IT1"))
    table = doc.css('.responsive table').last

    table.search('tr').each do |tr|
      profile = {
        :name => tr.search('a').text,
      }
      output << profile
    end

    output
end
