require './matchlist.rb'

class LeagueTable

	def initialize
		@match_list = MatchList.new
	end

	def matches
		@match_list
	end

	def get_results_table
		@match_list.all_matches_hash
	end

	# Returns the no. of points a team has, 0 by default
	def get_points(team_name)
		points = 0
		# Goes through matches results and 
		# If a team is present then adds to score

		# Since Ruby 1.9.1 Hash preserves the insertion order
		# https://stackoverflow.com/questions/12155383/how-to-get-hash-values-by-position-in-ruby
		get_results_table.each do |match|
			if match[1].has_key?(team_name)
				points = points + match[1][team_name]
			end
		end
		points
	end

	# Returns the no. of goals a team has scored, 0 by default
	# As far as I Understand, it is the same as get_goals_for.
	def get_goals_for(team_name)
		get_points(team_name)
	end

	# Returns the no. of goals a team has conceeded (had scored against them), 0 by default
	def get_goals_against(team_name)
		points = 0
		get_results_table.each do |match|
			if match[1].has_key?(team_name)
				# Get values for all keys except team_name
				points_conceeded = match[1].reject { |key, _| key == team_name }.values
				# Here should be only one number but just in case I sum array instead
				points = points + points_conceeded.sum
			end
		end
		points
	end

	# Return the no. of goals a team has scored minus the no. of goals a team has conceeded, 0 by default
	def get_goal_difference(team_name)
		get_goals_for(team_name) - get_goals_against(team_name)
	end

	def get_wins(team_name)
		wins = 0
		get_results_table.each do |match|
			if match[1].has_key?(team_name)
				# Win counted if team has 3 points
				if match[1][team_name] == 3
					wins = wins + 1
				end
			end
		end
		wins
	end

	def get_draws(team_name)
		draws = 0
		get_results_table.each do |match|
			if match[1].has_key?(team_name)
				# Draw counted if team has 1 point
				if match[1][team_name] == 1
					draws = draws + 1
				end
			end
		end
		draws
	end

end

lt = LeagueTable.new

lt.matches.push("Man Utd 3 - 0 Liverpool")
puts lt.get_draws("Man Utd")
#puts lt.get_goal_difference("Liverpool")
#puts lt.get_goals_against("Liverpool")

lt.matches.push("Liverpool 0 - 3 Man Utd")
puts lt.get_draws("Man Utd")

#puts lt.get_goal_difference("Liverpool")

#puts lt.get_goals_against("Liverpool")

lt.matches.push("Crawley 0  - 1 Colchester")
puts lt.get_draws("Colchester")


lt.matches.push("Crawley 1  - 1 Colchester")
puts lt.get_draws("Colchester")


#lt.get_results_table
#p lt.get_points("Man Utd")
#p lt.get_points("Liverpool")

#puts lt.matches.inspect
#lt.organize



# puts lt.get_goals_for("Man Utd") #  => 3
# puts lt.get_points("Man Utd")  # => 3
# puts lt.get_points("Liverpool") # => 0
# puts lt.get_goal_difference("Liverpool") # => -3

# lt.matches.push("Liverpool 1 - 1 Man Utd")
# puts lt.get_goals_for("Man Utd") # => 4
# puts lt.get_points("Man Utd") # => 4
# puts lt.get_points("Liverpool") # => 1
# puts lt.get_goals_against("Man Utd") # => 1
# puts lt.get_points("Tottenham") # => 0