require_relative './soccer_cli/team'
require_relative './soccer_cli/scraper'

class CommandLineInterface
  def run
    puts "Welcome to Serie A CLI"
    make_teams
    add_attributes_to_teams
    select_team
  end

  def make_teams
    hash_profile = Scraper.scraper_table(url)
    Team.new(hash_profile)
    i = 0
    Team.all.each { |team|
      i += 1
      puts "#{i}. #{team.name}"
    }
  end

  def add_attributes_to_teams
    base = "https://www.transfermarkt.us"
    Team.all.each do |team|
      attributes = Scraper.scraper_team_profile(base + team.url)
      team.add_attributes(attributes)
    end
  end

  def select_team
    input = ""
    puts "Select team by typing its table ranking"
    input = gets.strips
    team_selected = Team.find_by_ranking(input)

  end

end
