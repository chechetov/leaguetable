# Some parts are made with usage of ChatGPT
# But many are not.

class MatchList

  attr_reader :matches
  attr_reader :all_matches_hash

  def initialize
    @matches = []
    @all_matches_hash = {}
    @match_number = 0
  end

  # Against Ruby convention to satisfy the task.
  def push(match_result)
    @matches.push(match_result)
    @match_number += 1
    organize(match_result)
  end

  def organize(match_result)
  	match_result_arr = match_result.split("-")
  	match_result_hash = {}

  	match_result_arr.each do |team_result|
  		# Regular expression to match team score
  		regex = /\d+/
  		# Extracting team names and scores using regular expressions
  		team_name_1 = team_result.gsub(regex, "").strip
  		team_score_1 = team_result.scan(regex).first.to_i

  		team_name_2 = team_result.gsub(regex, "").strip
  		team_score_2 = team_result.scan(regex).first.to_i

  		match_result_hash[team_name_1] = team_score_1
  		match_result_hash[team_name_2] = team_score_2
  	end
    @all_matches_hash["match#{@match_number}"] = match_result_hash
  end


end