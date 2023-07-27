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

	def get_wins(team_name)
		wins = 0
		get_points_table.each do |match|
			if match[1][team_name] == 3
				wins = wins + 1
			end
		end
		wins
	end

	def get_draws(team_name)
		draws = 0
		get_points_table.each do |match|
			if match[1][team_name] == 1
				draws = draws +1
			end
		end
		draws
	end

	def get_losses(team_name)
		losses = 0
		get_points_table.each do |match|
			if match[1][team_name] == 0
				losses = losses + 1
			end
		end
		losses
	end

end

lt = LeagueTable.new
lt.matches.push("Man Utd 3 - 2 Liverpool")

puts "------"

puts "Goals_table: #{lt.get_goals_table}" 
puts "Points_table: #{lt.get_points_table}"

puts "Points for Liverpool: #{lt.get_points("Liverpool")}" # 0
puts "Points for Man Utd: #{lt.get_points("Man Utd")}" # 3
puts "Points for None: #{lt.get_points("None")}" # 0

puts "Goals for Liverpool: #{lt.get_goals_for("Liverpool")}" # 2
puts "Goals for Man Utd: #{lt.get_goals_for("Man Utd")}" # 3
puts "Goals for None: #{lt.get_goals_for("None")}" # 0

puts "Goals against Liverpool: #{lt.get_goals_against("Liverpool")}" # 3
puts "Goals against Man Utd: #{lt.get_goals_against("Man Utd")}" # 2
puts "Goals against None: #{lt.get_goals_against("None")}" # 0

puts "Goals difference Liverpool: #{lt.get_goal_difference("Liverpool")}" # -1
puts "Goals difference Man Utd: #{lt.get_goal_difference("Man Utd")}" # 1
puts "Goals difference None: #{lt.get_goal_difference("None")}" # 0

puts "Wins for Liverpool: #{lt.get_wins("Liverpool")}" # 0
puts "Wins for Man Utd: #{lt.get_wins("Man Utd")}" # 1
puts "Wins for None: #{lt.get_wins("None")}" # 0

puts "Draws for Liverpool: #{lt.get_draws("Liverpool")}" # 0
puts "Draws for Man Utd: #{lt.get_draws("Man Utd")}" # 0
puts "Draws for None: #{lt.get_draws("None")}" # 0

puts "Losses for Liverpool: #{lt.get_losses("Liverpool")}" # 1
puts "Losses for Man Utd: #{lt.get_losses("Man Utd")}" # 0
puts "Losses for None: #{lt.get_losses("None")}" # 0

puts "------"


lt.matches.push("Man Utd 1 - 2 Liverpool")

puts "------"

puts "Goals_table: #{lt.get_goals_table}" 
puts "Points_table: #{lt.get_points_table}"

puts "Points for Liverpool: #{lt.get_points("Liverpool")}" # 3
puts "Points for Man Utd: #{lt.get_points("Man Utd")}" # 3
puts "Points for None: #{lt.get_points("None")}" # 0

puts "Goals for Liverpool: #{lt.get_goals_for("Liverpool")}" # 4
puts "Goals for Man Utd: #{lt.get_goals_for("Man Utd")}" # 4
puts "Goals for None: #{lt.get_goals_for("None")}" # 0

puts "Goals against Liverpool: #{lt.get_goals_against("Liverpool")}" # 4
puts "Goals against Man Utd: #{lt.get_goals_against("Man Utd")}" # 4
puts "Goals against None: #{lt.get_goals_against("None")}" # 0

puts "Goals difference Liverpool: #{lt.get_goal_difference("Liverpool")}" # 0
puts "Goals difference Man Utd: #{lt.get_goal_difference("Man Utd")}" # 0
puts "Goals difference None: #{lt.get_goal_difference("None")}" # 0

puts "Wins for Liverpool: #{lt.get_wins("Liverpool")}" # 1
puts "Wins for Man Utd: #{lt.get_wins("Man Utd")}" # 1
puts "Wins for None: #{lt.get_wins("None")}" # 0

puts "Draws for Liverpool: #{lt.get_draws("Liverpool")}" # 0
puts "Draws for Man Utd: #{lt.get_draws("Man Utd")}" # 0
puts "Draws for None: #{lt.get_draws("None")}" # 0

puts "Losses for Liverpool: #{lt.get_losses("Liverpool")}" # 1
puts "Losses for Man Utd: #{lt.get_losses("Man Utd")}" # 1
puts "Losses for None: #{lt.get_losses("None")}" # 0

puts "------"

lt.matches.push("Man Utd 1 - 1 Liverpool")

puts "------"

puts "Goals_table: #{lt.get_goals_table}" 
puts "Points_table: #{lt.get_points_table}"

puts "Points for Liverpool: #{lt.get_points("Liverpool")}" # 4
puts "Points for Man Utd: #{lt.get_points("Man Utd")}" # 4
puts "Points for None: #{lt.get_points("None")}" # 0

puts "Goals for Liverpool: #{lt.get_goals_for("Liverpool")}" # 5
puts "Goals for Man Utd: #{lt.get_goals_for("Man Utd")}" # 5
puts "Goals for None: #{lt.get_goals_for("None")}" # 0

puts "Goals against Liverpool: #{lt.get_goals_against("Liverpool")}" # 5
puts "Goals against Man Utd: #{lt.get_goals_against("Man Utd")}" # 5
puts "Goals against None: #{lt.get_goals_against("None")}" # 0

puts "Goals difference Liverpool: #{lt.get_goal_difference("Liverpool")}" # 0
puts "Goals difference Man Utd: #{lt.get_goal_difference("Man Utd")}" # 0
puts "Goals difference None: #{lt.get_goal_difference("None")}" # 0

puts "Wins for Liverpool: #{lt.get_wins("Liverpool")}" # 1
puts "Wins for Man Utd: #{lt.get_wins("Man Utd")}" # 1
puts "Wins for None: #{lt.get_wins("None")}" # 0

puts "Draws for Liverpool: #{lt.get_draws("Liverpool")}" # 1
puts "Draws for Man Utd: #{lt.get_draws("Man Utd")}" # 1
puts "Draws for None: #{lt.get_draws("None")}" # 0

puts "Losses for Liverpool: #{lt.get_losses("Liverpool")}" # 1
puts "Losses for Man Utd: #{lt.get_losses("Man Utd")}" # 1
puts "Losses for None: #{lt.get_losses("None")}" # 0

puts "------"



