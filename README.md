# Task as provided.

Guidlines
0. Create and share with me trough skype github repo
1. I’ve prepare a ruby template (run.rb) that you could use (you don't have to!)
2. Write specs for your classes.
3. You can use any libraries and tools.
4. Please push to github repo as often as it possible
5. DDL: Jul/28/2023

Description:
Complete the LeagueTable class.
The LeagueTable class is used to store results of football (soccer) matches played, as well as return and display various stats about each team.

The LeagueTable class requires an array of strings called matches which stores the results of matches played.

Match results will always be passed as a String in the format: `"Home Team 0 - 0 Away Team"` for example: `"Man Utd 3 - 0 Liverpool"`.

When a new match result is given, points are awarded to teams as follows:
    3 points for a win
    1 point for a draw
    0 points for loss

The class must have the following methods:
    get_points(team_name) # Returns the no. of points a team has, 0 by default
    get_goals_for(team_name) # Returns the no. of goals a team has scored, 0 by default
    get_goals_against(team_name) # Returns the no. of goals a team has conceeded (had scored against them), 0 by default
    get_goal_difference(team_name) # Return the no. of goals a team has scored minus the no. of goals a team has conceeded, 0 by default
    get_wins(team_name) # Return the no. of wins a team has, 0 by default
    get_draws(team_name) # Return the no. of draws a team has, 0 by default
    get_losses(team_name) # Return the no. of losses a team has, 0 by default

For example:
    lt = LeagueTable.new

    lt.matches.push("Man Utd 3 - 0 Liverpool")

    puts lt.get_goals_for("Man Utd") => 3
    puts lt.get_points("Man Utd") => 3
    puts lt.get_points("Liverpool") => 0
    puts lt.get_goal_difference("Liverpool") => -3

    lt.matches.push("Liverpool 1 - 1 Man Utd")

    puts lt.get_goals_for("Man Utd") => 4
    puts lt.get_points("Man Utd") => 4
    puts lt.get_points("Liverpool") => 1
    puts lt.get_goals_against("Man Utd") => 1
    puts lt.get_points("Tottenham") => 0
Run.rb template:

system 'rm Gemfile' if File.exist?('Gemfile')
File.write('Gemfile', <<-GEMFILE)
  source 'https://rubygems.org'
GEMFILE

system 'bundle install'

require 'bundler'
Bundler.setup(:default)

require 'minitest/autorun'
require 'logger'

require './your_solution.rb'

describe LeagueTable do
  #your specs
end
