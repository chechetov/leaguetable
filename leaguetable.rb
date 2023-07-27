require './matchlist.rb'

class LeagueTable

	def initialize
		@match_list = MatchList.new
	end

	def matches
		@match_list
	end

	def get_results
		@match_list.all_matches_hash
	end

	def get_points(team_name)

		points = 0

		# Goes through matches results and 
		# If a team is present then adds to score

		# Since Ruby 1.9.1 Hash preserves the insertion order
		# https://stackoverflow.com/questions/12155383/how-to-get-hash-values-by-position-in-ruby
		get_results.each do |match|
			if match[1].has_key?(team_name)
				points = points + match[1][team_name]
			end
		end

		points

	end

	def get_goals_for(team_name)
		get_points(team_name)
	end

	def get_goals_against(team_name)

	end

end

lt = LeagueTable.new
lt.matches.push("Man Utd 3 - 0 Liverpool")

puts lt.get_goals_for("Man Utd")
puts lt.get_points("Man Utd")
puts lt.get_points("Liverpool")

lt.matches.push("Liverpool 1 - 1 Man Utd")

puts lt.get_goals_for("Man Utd")
puts lt.get_points("Man Utd")
puts lt.get_points("Liverpool")



#lt.matches.push("Crawley 3  - 2 Colchester")

#lt.get_results
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