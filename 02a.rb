pos = depth = 0
$stdin.each do |line|
  case line
  when /^forward (\d+)$/ then pos += $1.to_i
  when /^(up|down) (\d+)$/ then depth += ($1 == 'down' ? 1 : -1) * $2.to_i
  else next
  end
end
puts pos * depth
