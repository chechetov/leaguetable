class LeagueTable
	def initialize
		@teams = {}
	end

	def matches(result)

	end

	
end



lt = LeagueTable.new

lt.matches.push("Man Utd 3 - 0 Liverpool")
puts lt.get_goals_for("Man Utd") #  => 3
puts lt.get_points("Man Utd")  # => 3
puts lt.get_points("Liverpool") # => 0
puts lt.get_goal_difference("Liverpool") # => -3

lt.matches.push("Liverpool 1 - 1 Man Utd")
puts lt.get_goals_for("Man Utd") # => 4
puts lt.get_points("Man Utd") # => 4
puts lt.get_points("Liverpool") # => 1
puts lt.get_goals_against("Man Utd") # => 1
puts lt.get_points("Tottenham") # => 0