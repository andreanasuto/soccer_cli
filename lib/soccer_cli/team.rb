module SoccerCli

  class Team
    attr_accessor :points, :name, :average_age, :mkt_value, :stadium, :url
    @@all = []
    # [{:points => "12", :name => "Juventus",
    # :age => "28,2", :value => "$800mn"}]

    @@url = "https://www.transfermarkt.us/serie-a/tabelle/wettbewerb/IT1/saison_id/2018"

    def initialize(hash_teams)
      hash_teams.each { |k,v| instance_variable_set("@#{k}", v) unless v.nil? }
      # hash_teams.each { |k,v| self.send("#{k}=", v) unless v.nil? }
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

    def self.make_teams
      puts "Loading: just wait, magic needs time!"
      teams = SoccerCli::Scraper.scraper_table(@@url)
      SoccerCli::Team.new_from_collection(teams)
    end

    def add_attributes_to_team
      base = "https://www.transfermarkt.us"
      attributes = Scraper.scraper_team_profile(base + self.url)
      self.add_attributes(attributes)
    end

  end
end
