require './matchlist.rb'

class LeagueTable

	attr_reader :matches

	def initialize
		@match_list = MatchList.new
	end

	def matches
		@match_list
	end

	def organize
		matches_array = @match_list.matches.map { |string| string.split("-") }

		p matches_array

		matches_results = {}

		matches_array.each do |match_result|
				p match_result

				# Regular expression to match team score
				regex = /\d+/
				# Extracting team names and scores using regular expressions
				team_name_1 = match_result[0].gsub(regex, "").strip
				team_score_1 = match_result[0].scan(regex).first.to_i

				team_name_2 = match_result[1].gsub(regex, "").strip
				team_score_2 = match_result[1].scan(regex).first.to_i

				matches_results[team_name_1] = team_score_1
				matches_results[team_name_2] = team_score_2
		end

		p matches_results

	end

	def get_goals_for

	end

end

lt = LeagueTable.new
lt.matches.push("Man Utd 3 - 0 Liverpool")
#lt.matches.push("Liverpool 1 - 1 Man Utd")

puts lt.matches.inspect
lt.organize



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