buffer = File.read('Day6.txt')

def find_signal(buffer, n = 0)
  return nil if buffer.empty?
  return n + 4 if buffer[0..3].then { |portion| portion.chars.uniq == portion.chars }
  find_signal(buffer[1..], n + 1)
end

p find_signal(buffer)

def find_message(buffer, n = 0)
  return nil if buffer.empty?
  return n + 14 if buffer[0..13].then { |portion| portion.chars.uniq == portion.chars }
  find_message(buffer[1..], n + 1)
end

p find_message(buffer)
