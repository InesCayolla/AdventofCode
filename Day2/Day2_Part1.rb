
# A for Rock, B for Paper, and C for Scissors.
#
# 1 for Rock, 2 for Paper, and 3 for Scissors)
# plus the score for the outcome of the round
# (0 if you lost, 3 if the round was a draw, and 6 if you won)
# X for Rock, Y for Paper, and Z for Scissors.
# Winning every time would be suspicious, so the responses must have been carefully chosen.

score = []

input = File.read("Day2_.txt")
  .split("\n").map do |line|
    if line.include?("X")
      score << 1
    elsif line.include?("Y")
      score << 2
    else
      score << 3
    end
    if line == "A X" || line == "B Y" || line == "C Z"
      score << 3
    elsif line == "A Y" || line == "B Z" || line == "C X"
      score << 6
    else
      score << 0
    end
  end

  p score.sum 
