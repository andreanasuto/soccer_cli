require_relative '../soccer_cli/team'
require_relative '../soccer_cli/scraper'

class CommandLineInterface
  @@url = "https://www.transfermarkt.us/serie-a/tabelle/wettbewerb/IT1/saison_id/2018"

  def run
    puts "Welcome to Serie A CLI"
    make_teams
    add_attributes_to_teams
    select_team
  end

  def make_teams
    teams = Scraper.scraper_table(@@url)
    Team.new_from_collection(teams)
    i = 0
    Team.all.each { |team|
      i += 1
      puts "#{i}. #{team.name}"
    }
  end

  def add_attributes_to_teams
    base = "https://www.transfermarkt.us"
    Team.all.each do |team|
      binding.pry
      attributes = Scraper.scraper_team_profile(base + team.url)
      team.add_attributes(attributes)
    end
  end

  def select_team
    input = ""
    puts "Select team by typing its table ranking"
    input = gets.strips
    team = Team.find_by_ranking(input)
    puts "Here some details:"
    puts "#{team.name} is currently value $#{team.value}mn"
    puts "#{team.name} players average age is #{team.average_age}"
    puts "They play at #{team.stadium}"
  end

end
