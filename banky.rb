file_lines = []

File.open("test_digits.txt").each do |line|
  file_lines << line.chomp
end

# file_lines.delete_if { |line| line == ""}

file_lines.each do |line|
  p line
end

file_lines.map do |line|

end

#  _
# | |
# |_|

# 0: [" _ ", "| |", "|_|"]