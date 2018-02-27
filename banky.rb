
DIGIT_FINDER = {
      " _ " +
      "| |" +
      "|_|" => "0",

      "   " +
      "  |" +
      "  |" => "1",

      " _ " +
      " _|" +
      "|_ " => "2",

      " _ " +
      " _|" +
      " _|" => "3",

      "   " +
      "|_|" +
      "  |" => "4",

      " _ " +
      "|_ " +
      " _|" => "5",

      " _ " +
      "|_ " +
      "|_|" => "6",

      " _ " +
      "  |" +
      "  |" => "7",

      " _ " +
      "|_|" +
      "|_|" => "8",

      " _ " +
      "|_|" +
      " _|" => "9"
}

  # Creates array of strings and removes newline characters.
def parse_txt_file(filename)
  file_lines = []
  File.open(filename).each do |line|
    file_lines << line.chomp
  end
  file_lines
end

  # Encases every four lines inside a subarray.
def separate_digit_lines(parsed_text_file)
  parsed_text_file.each_slice(4).to_a
end

  # Removes the blank fourth line from each digit chunk.
  # Also handles a digit chunk whose first line might be made of just 1s and 4s.
def clean_digit_lines(separated_digit_lines)
  separated_digit_lines.each do |chunk|
    chunk.delete_at(3)
    if chunk[0].length == 0
      chunk[0] = "                           "
    end
  end
end

  # Will convert a single three-line array into 9 digits:
def convert_to_number_chars(cleaned_line)
  digits = ""
  chunked = cleaned_line.map! { |line| line.chars.each_slice(3).to_a }.transpose
  chunked.each { |digit| digits << DIGIT_FINDER[digit.flatten.join] }
  digits
end
cleaned_line = [" _  _  _  _  _  _  _  _  _ ", "| || || || || || || || || |", "|_||_||_||_||_||_||_||_||_|"]


# ---------------------------------------------------------------------------- #
parsed = parse_txt_file("test_digits.txt")
separated = separate_digit_lines(parsed)
cleaned = clean_digit_lines(separated)

puts convert_to_number_chars(cleaned_line)

# puts DIGIT_FINDER.key("1")


#  _
# | |
# |_|

# 0: [" _ ", "| |", "|_|"]