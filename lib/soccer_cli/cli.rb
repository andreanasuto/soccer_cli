class CommandLineInterface
  def call
    puts "Choose your competition"
    list_competitions
    list_standings
  end

  def list_competitions
    puts "1. Liga / 2.Premier League..."
  end

  def list_standings
    puts "Here's current Premier League standings"
    puts "1.City 2.Liverpool.."
  end
end
