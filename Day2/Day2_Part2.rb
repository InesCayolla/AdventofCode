

score = []

input = File.read("Day2.txt")
  .split("\n").map do |line|
    if line.include?("X")
      score << 0
    elsif line.include?("Y")
      score << 3
    else
      score << 6
    end
    if line == "A X" || line == "B Z" || line == "C Y"
      score << 3
    elsif line == "A Z" || line == "B Y" || line == "C X"
      score << 2
    else
      score << 1
    end
  end
  p score.sum
