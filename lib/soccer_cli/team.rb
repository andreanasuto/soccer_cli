class Team
  attr_accessor :points, :name, :age, :value

  # [{:points => "12", :name => "Juventus",
  # :age => "28,2", :value => "$800mn"}]

  def initialize(hash_teams)
    hash_teams.each { |k,v| instance_variable_set("@#{k}", v) }
  end
end
