
calories = File.read("input.txt")
  .split("\n\n") .map do |line|
    line.split("\n").map(&:to_i).sum
  end
  .sort

puts part_1 = calories.last
puts part_2 = calories.last(3).sum
