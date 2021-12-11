numbers = $stdin.filter_map { _1 =~ /^[01]+\b/ and $&.to_i 2 }

find_common = -> numbers, least: false do
  cur_bit = nil
  while (total = numbers.size) > 0
    break numbers.fetch 0 if total == 1
    cur_bit ||= 1 << (numbers.map(&:bit_length).max - 1)
    raise "not found" if cur_bit <= 0
    have_zero, rest = numbers.partition { (_1 & cur_bit).zero? }
    numbers = (have_zero.size > rest.size) ^ least ? have_zero : rest
    cur_bit >>= 1
  end
end

oxygen_best = find_common.(numbers)
co2_best = find_common.(numbers, least: true)

puts oxygen_best * co2_best
