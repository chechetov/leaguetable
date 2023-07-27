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
		# Goes through points table and adds points for a team if team present
		points = 0
		get_points_table.each do |match|
			if match[1].has_key?(team_name)
				points = points + match[1][team_name]
			end
		end
		points
	end

	def get_goals_for(team_name)
	# Goes through teams table and adds goals if team present
		goals = 0
		get_goals_table.each do |match|
			if match[1].has_key?(team_name)
				goals = goals + match[1][team_name]
			end
		end
		goals
	end

end

lt = LeagueTable.new
lt.matches.push("Man Utd 3 - 2 Liverpool")

puts "Goals_table: #{lt.get_goals_table}" 
puts "Points_table: #{lt.get_points_table}"

puts "Get points for Liverpool: #{lt.get_points("Liverpool")}" # 0
puts "Get points for Manchester: #{lt.get_points("Man Utd")}" # 3

puts "Get goals for Liverpool: #{lt.get_goals_for("Liverpool")}" # 2
puts "Get goals for Manchester: #{lt.get_goals_for("Man Utd")}" # 3


