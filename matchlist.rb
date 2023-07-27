# Some (tiny) parts are made with usage of ChatGPT
# But most are not

class MatchList

  attr_reader :matches
  attr_reader :all_matches_goals_table
  attr_reader :all_matches_points_table

  def initialize
    @matches = []
    @all_matches_goals_table = {}
    @all_matches_points_table = {}
    @match_number = 0
  end

  # Against Ruby convention to satisfy the task.
  def push(match_result)
    @matches.push(match_result)
    @match_number += 1
    parsed_match = parse_match_result(match_result)
    add_to_goals_table(parsed_match)
    add_to_points_table(parsed_match)
  end

  def parse_match_result(match_result)
    # Parses match result from string into hash
    # {'teamA' => 'goalsA', 'teamB' => 'goalsB'}

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
    match_result_hash
  end

  def add_to_goals_table(match_result)
    # Adds parsed match result into a Goals table
  	# {'matchN' => {'team1' => 'goals1', 'team2'=>'goals2'}}
    @all_matches_goals_table["match#{@match_number}"] = match_result
  end

  def add_to_points_table(match_result)
    # Calculates points for given match result and adds into Points table
    # # {'matchN' => {'team1' => 'points1', 'team2'=>'points2'}}

    points_hash = {}

    # Corresponds to order of insertion
    # ["Team A", "Team B"]
    teams = match_result.keys
    # ["Goals A", "Goals B"]
    goals = match_result.values

    # Goals A > Goals B => Team A has 3 points, Team B has 0 points
    if goals[0] > goals[1]
      points_hash[teams[0]] = 3
      points_hash[teams[1]] = 0
    end

    # Goals B > Goals A => Team B has 3 points, Team A has 0 points
    if goals[0] < goals[1]
      points_hash[teams[1]] = 3
      points_hash[teams[0]] = 0
    end

    # Goals A == Goals B => 1 point for each team
    if goals[0] == goals[1]
      points_hash[teams[0]] = 1
      points_hash[teams[1]] = 1
    end

    @all_matches_points_table["match#{@match_number}"] = points_hash
  end
end