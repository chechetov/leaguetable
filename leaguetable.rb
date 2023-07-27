require './matchlist.rb'

class LeagueTable

	def initialize
		@match_list = MatchList.new
	end

	def matches
		@match_list
	end

	def get_goals_table
		@match_list.all_matches_goals_table
	end

	def get_points_table
		@match_list.all_matches_points_table
	end

	def get_points(team_name)
		points = 0
		# Goes through matches results and 
		# If a team is present then adds to score

		# Since Ruby 1.9.1 Hash preserves the insertion order
		# https://stackoverflow.com/questions/12155383/how-to-get-hash-values-by-position-in-ruby
		get_points_table.each do |match|
			if match[1].has_key?(team_name)
				points = points + match[1][team_name]
			end
		end
		points
	end

end

lt = LeagueTable.new
lt.matches.push("Man Utd 3 - 2 Liverpool")
puts "Goals_table: #{lt.get_goals_table}" 
puts "Points_table: #{lt.get_points_table}"

puts "Get points for Liverpool: #{lt.get_points("Liverpool")}" # 0
puts "Get points for Manchester: #{lt.get_points("Man Utd")}" # 3


