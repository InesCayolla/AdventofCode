input = File.read("day3_input.txt")

sacks = input.split("\n").map do |line|
  line.chars.each_slice(line.size / 2).map(&:join)
end

item = sacks.map do |comp1, comp2|
  [comp1.chars.uniq, comp2.chars.uniq].flatten.sort.join.scan(/(.)\1/).flatten[0]
end

def priority(item)
  adjust = (item == item.upcase ? 38 : 96)
  item.ord - adjust
end

item.map! do |item|
 priority(item)
end

puts "Part 1 Solution: #{item.sum}"


elves = sacks.map(&:join).each_slice(3).to_a
elves.map! do |group|
  group.map { |item| item.chars.uniq.join }.join.chars.sort.join.scan(/(.)\1\1/).flatten[0]
end
elves.map! { |item| priority(item) }

puts "Part 2 Solution: #{elves.sum}"
