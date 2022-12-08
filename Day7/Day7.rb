
folder_sizes = Hash.new(0)

File.readlines('input_Day7.txt', chomp: true).map(&:split).each_with_object([]) do |line, stack|
  case line
  in ['$', 'cd', '..']
    stack.pop
  in ['$', 'cd', folder]
    stack.push folder
  in [size, file] if size.match?(/^\d+$/)
    stack.reduce('') { |a, b| folder_sizes[a += b] += size.to_i; b }
  else
  end
end

puts folder_sizes.values.reject { |a| a > 100_000 }.sum
puts folder_sizes.values.reject { |b| b < folder_sizes['/'] - 40_000_000 }.min
