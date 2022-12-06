stacks, instructions = File.read('Day5.txt').split("\n\n")

stacks = stacks.split("\n").map(&:chars).reverse.transpose

stacks = stacks.select do |first, *rest|
  first.match?(/\d+/)
end

stacks.map do |item|
  item.delete(" ")
end

stacks = stacks.map {|first, *rest| [first, rest]}.to_h

instructions.split("\n").each do |instruction|
 move, from, to = instruction.scan(/\d+/)
  move.to_i.times do
   stacks[to] << stacks[from].pop
  end
end

puts stacks.values.map(&:last).join

instructions.split("\n").each do |instruction|
  move, from, to = instruction.scan(/\d+/)
  instruction_action = stacks[from].pop(move.to_i)
  stacks[to] += instruction_action
end

puts stacks.values.map(&:last).join
