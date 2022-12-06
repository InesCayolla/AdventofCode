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

  # The only change is using `pop(n) rather than `n.times`
  new_and_improved_crate_mover_9001 = stacks[from].pop(move.to_i)

  stacks[to] += new_and_improved_crate_mover_9001
end

puts stacks.values.map(&:last).join
