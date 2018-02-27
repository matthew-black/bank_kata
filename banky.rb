file_lines = []

File.open("test_digits.txt").each do |line|
  file_lines << line.chomp
end

chunked = file_lines.each_slice(4).to_a

# chunked.map.with_index do |line, i|

# end

#  _
# | |
# |_|

# 0: [" _ ", "| |", "|_|"]