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

end


lt = LeagueTable.new
lt.matches.push("Man Utd 3 - 2 Liverpool")
puts "Goals_table: #{lt.get_goals_table}" 
puts "Points_table: #{lt.get_points_table}"

