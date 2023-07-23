# ChatGPT thanks for this custom library

class MatchList
  attr_reader :matches

  def initialize
    @matches = []
  end

  def push(match_result)
    @matches.push(match_result)
  end
end