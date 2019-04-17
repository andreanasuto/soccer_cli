require_relative './soccer_cli/team'
require_relative './soccer_cli/scraper'

class CommandLineInterface
  def run
    puts "Welcome to Serie A CLI"
    league_table
  end

  def league_table
    hash_profile = Scraper.scraper_table(url)
    Team.new(hash_profile)
    i = 0
    Team.all.each { |team|
      i += 1

    }
  end

  def list_standings
    puts "Here's current Premier League standings"
    puts "1.City 2.Liverpool.."
  end
end
