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

	def get_goals_against(team_name)
		goals = 0
		get_goals_table.each do |match|
			if match[1].has_key?(team_name)
			# Get values for all keys except team_name
			goals_conceeded = match[1].reject { |key, _| key == team_name }.values
			# Here should be only one number but just in case I sum array into integer
			goals = goals + goals_conceeded.sum
		end
	end
	goals
	end

	def get_goal_difference(team_name)
		get_goals_for(team_name) - get_goals_against(team_name)
	end

end

lt = LeagueTable.new
lt.matches.push("Man Utd 3 - 2 Liverpool")

puts "Goals_table: #{lt.get_goals_table}" 
puts "Points_table: #{lt.get_points_table}"

puts "Points for Liverpool: #{lt.get_points("Liverpool")}" # 0
puts "Points for Manchester: #{lt.get_points("Man Utd")}" # 3

puts "Goals for Liverpool: #{lt.get_goals_for("Liverpool")}" # 2
puts "Goals for Manchester: #{lt.get_goals_for("Man Utd")}" # 3

puts "Goals against Liverpool: #{lt.get_goals_against("Liverpool")}" # 3
puts "Goals against Manchester: #{lt.get_goals_against("Man Utd")}" # 2

puts "Goals difference Liverpool: #{lt.get_goal_difference("Liverpool")}" # -1
puts "Goals difference Manchester: #{lt.get_goal_difference("Manchester")}" # 1


lt.matches.push("Man Utd 1 - 2 Liverpool")

puts "Goals_table: #{lt.get_goals_table}" 
puts "Points_table: #{lt.get_points_table}"

puts "Points for Liverpool: #{lt.get_points("Liverpool")}" # 3
puts "Points for Manchester: #{lt.get_points("Man Utd")}" # 3

puts "Goals for Liverpool: #{lt.get_goals_for("Liverpool")}" # 4
puts "Goals for Manchester: #{lt.get_goals_for("Man Utd")}" # 4

puts "Goals against Liverpool: #{lt.get_goals_against("Liverpool")}" # 4
puts "Goals against Manchester: #{lt.get_goals_against("Man Utd")}" # 4

puts "Goals difference Liverpool: #{lt.get_goal_difference("Liverpool")}" # 0
puts "Goals difference Manchester: #{lt.get_goal_difference("Manchester")}" # 0





