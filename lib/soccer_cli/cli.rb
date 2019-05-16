module SoccerCli
  class CommandLineInterface

    def run
      puts "Welcome to Serie A CLI"
      SoccerCli::Team.make_teams
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
      SoccerCli::Team.all.each { |team|
        i += 1
        puts "#{i}. #{team.name}"
      }
      puts "Select team by typing its table ranking or type 'exit' to quit the app."
    end

    def select_team
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= SoccerCli::Team.all.size
        team = SoccerCli::Team.find_by_ranking(input.to_i)
        unless team.mkt_value
          team.add_attributes_to_team(input.to_i)
        end
        puts "Here some details:"
        puts "#{team.name} has #{team.points} points"
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
end
