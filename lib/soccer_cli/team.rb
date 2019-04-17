class Team
  attr_accessor :points, :name, :average_age, :mkt_value, :stadium, :url
  @@all = []
  # [{:points => "12", :name => "Juventus",
  # :age => "28,2", :value => "$800mn"}]

  def initialize(hash_teams)
    hash_teams.each { |k,v| instance_variable_set("@#{k}", v) unless v.nil? }
    @@all << self
  end

  def self.new_from_collection(team_profile_array)
    team_profile_array.each { |team_hash|
      self.new(team_hash)
    }
  end

  def add_attributes(hash_attributes)
    hash_attributes.each { |k,v| instance_variable_set("@#{k}", v) unless v.nil?}
  end

  def self.all
    @@all
  end

  def self.find_by_ranking(rank)
    self.all.find { |team| self.all.index(team) == rank-1}
  end

end
