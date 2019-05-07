require_relative '../soccer_cli/team'
require_relative '../soccer_cli/scraper'

class CommandLineInterface
  # adjust the CLI so that the program doesn't exit after looking at one team
  # instead, give the user the option to see them menu (list) again, or type 'exit' to require_relative
  def run
    puts "Welcome to Serie A CLI"
    Team.make_teams
    Team.add_attributes_to_teams
    display
  end

  def display
    print_teams
    select_team
  end

  def show_more
    puts "Do you want to check other teams?(Yes/No)"
    input = gets.strip.downcase
    if input == "yes"
      display
    elsif input == "no" || input == "exit"
      puts "Thanks and see you soon!"
    else
      puts "I didn't get it. Let me ask you again"
      show_more
    end
  end

  def print_teams
    i = 0
    Team.all.each { |team|
      i += 1
      puts "#{i}. #{team.name}"
    }
    puts "Select team by typing its table ranking or type 'exit' to quit the app."
  end

  def select_team
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i <= Team.all.size
      team = Team.find_by_ranking(input.to_i)
      puts "Here some details:"
      puts "#{team.name} is currently valued $#{team.mkt_value}mn"
      puts "#{team.name} players average age is #{team.average_age}"
      puts "They play at #{team.stadium}"
      show_more
    elsif input == "exit"
      puts "Goodbye"
    else
      puts "Please type a valid rank to select your team"
      select_team
    end
  end

end
