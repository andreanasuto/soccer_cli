class Team
  attr_accessor :points, :name, :average_age, :value, :stadium
  @@all = []
  # [{:points => "12", :name => "Juventus",
  # :age => "28,2", :value => "$800mn"}]

  def initialize(hash_teams)
    hash_teams.each { |k,v| instance_variable_set("@#{k}", v) }
    @@all << self
  end

  def self.new_from_collection(team_profile_array)
    team_array.each { |team_hash|
      self.new(team_hash)
    }
  end
  def add_attributes(hash_attributes)
    hash_attributes.each { |k,v| instance_variable_set("@#{k}", v)}
  end

  def self.all
    @@all
  end

  def self.find_by_ranking(rank)
    team_sorted = self.all.sort_by { |team| team.points}
    team_sorted.select { |team| teams_sorted.index(team) == rank-1}
  end

end
