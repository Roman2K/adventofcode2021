stats = Hash.new 0
total = 0
$stdin.each do |bits|
  bits = (bits[/^[01]+\b/] or next).to_i 2
  (0...bits.bit_length).each do |pos|
    stats[1 << pos] += bits[pos]
  end
  total += 1
end

gamma = epsilon = 0
stats.each do |bit, ones|
  if ones > total / 2
    gamma |= bit
  else
    epsilon |= bit
  end
end

puts gamma * epsilon
