require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper
  # url = https://www.transfermarkt.us/serie-a/tabelle/wettbewerb/IT1/saison_id/2018
  def self.scraper_team_table(url)
    output = []
    doc = Nokogiri::HTML(open(url))
    table = doc.css('.responsive table').last

    table.search('tr').each do |tr|
      profile = {
        :name => tr.css('td.no-border-links.hauptlink a').text
        :points => tr.css('td.zentriert')[7].text
        #add https://www.transfermarkt.us to get the working link
        :url => tr.css('td.no-border-links.hauptlink a').attr('href')
      }
      output << profile
  end

  def self.scraper_team_profile(url)
    #url = https://www.transfermarkt.us/inter-mailand/spielplan/verein/46/saison_id/2018
    doc = Nokogiri::HTML(open(url))
    first = doc.css('.dataBottom > .dataDaten').first
    second = doc.css('.dataBottom > .dataDaten').last

    profile = {
      :average_age => first.search('p')[1].css('span.dataValue').text.strip
      :stadium => second.search('p')[1].css('span.dataValue a').text.strip
      :mkt_value => doc.css('.dataMarktwert a').children[1].text
    }
  end

end
