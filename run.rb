system 'rm Gemfile' if File.exist?('Gemfile')
File.write('Gemfile', <<-GEMFILE)
  source 'https://rubygems.org'
  gem 'minitest'
  gem 'logger' 
GEMFILE

# In case sudo needed.
system 'bundle install --path vendor/bundle'

require 'bundler'
Bundler.setup(:default)

require 'minitest/autorun'
require 'logger'

require './leaguetable.rb'

describe LeagueTable do
	# your specs..
	before do
		@lt = LeagueTable.new
		@lt.matches.push("Team A 1 - 2 Team B") # B wins =>  B + 3 points
		@lt.matches.push("Team A 3 - 4 Team C") # C wins =>  C + 3 points 
		@lt.matches.push("Team B 1 - 5 Team A") # A wins =>  A + 3 points 
		@lt.matches.push("Team B 3 - 3 Team C") # B,C Draw => B, C + 1 point
		@lt.matches.push("Team C 2 - 1 Team A") # C wins => C + 3 points
		@lt.matches.push("Team C 2 - 2 Team B") # C, B Draw => C, B + 1 point
	end

	it "returns correct number of points for each team" do
		assert_equal 3, @lt.get_points("Team A") # one win for A => 3 points
		assert_equal 5, @lt.get_points("Team B") # one win, two draws B = 3 + 2 points = 5
		assert_equal 8, @lt.get_points("Team C") # two wins for C + two draws => 6 + 2 = 8
		assert_equal 0, @lt.get_points("Team D") # D not present hence 0.
	end

	it "returns correct number of goals for each team" do
		assert_equal 10, @lt.get_goals_for("Team A") # 1 + 3 + 5 + 1 => 10
		assert_equal 8, @lt.get_goals_for("Team B")  # 2 + 1 + 3 + 2 => 8
		assert_equal 11, @lt.get_goals_for("Team C") # 4 + 3 + 2 + 2 => 11
		assert_equal 0, @lt.get_goals_for("Team D") # D not present hence 0.
	end

	it "returns correct number of goals against each team" do
		assert_equal 9, @lt.get_goals_against("Team A") # 2 + 4 + 1 + 2 => 9
		assert_equal 11, @lt.get_goals_against("Team B") # 1 + 5 + 3 + 2 => 11
		assert_equal 9, @lt.get_goals_against("Team C") # 3 + 3 + 1 + 2 => 9
		assert_equal 0, @lt.get_goals_against("Team D") # D not present hence 0.
	end

	it "returns correct number of goal differrences for each team" do
		assert_equal 1, @lt.get_goal_difference("Team A") # 1 - 2 = -1 , 3 - 4 = -1 , 5 - 1 = 4, 1 - 2 = -1 | -1 -1 + 4 -1 => 1
		assert_equal -3, @lt.get_goal_difference("Team B") # 2 - 1 = 1 , 1 - 5 = -4, 3 - 3 = 0 | 1 - 4 - 0 = -3 
		assert_equal 2, @lt.get_goal_difference("Team C") # 4 -3 = 1, 3-3 = 0, 2-1 =1, 2-2 = 0
		assert_equal 0, @lt.get_goal_difference("Team D") # D not present hence 0.

	end

	it "returns correct number of draws for each team" do
		assert_equal 0, @lt.get_draws("Team A") # no draws
		assert_equal 2, @lt.get_draws("Team B") # B 2 draws
		assert_equal 2, @lt.get_draws("Team C") # C 2 draws
		assert_equal 0, @lt.get_draws("Team D") # D not present hence 0.
	end

	it "returns correct number of wins for each team" do
		assert_equal 1, @lt.get_wins("Team A") # one win for A
		assert_equal 1, @lt.get_wins("Team B") # one win for B
		assert_equal 2, @lt.get_wins("Team C") # two wins for C
	end

	it "returns correct number of losses for each team" do
		assert_equal 3, @lt.get_losses("Team A") # A 3 losses..
		assert_equal 1, @lt.get_losses("Team B") # B 1 loss.
		assert_equal 0, @lt.get_losses("Team C") # C no loss.
		assert_equal 0, @lt.get_losses("Team D") # 0 not there..
	end
end
