# Fun little data parsing kata from http://codingdojo.org/kata/BankOCR/


  # Hash to convert a nine-character digit into a single number character.
DIGIT_DICTIONARY = {
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

  # Converts a three-line digit array into a nine-digit string:
def convert_to_number_chars(multiline_digit)
  digits = ""
  chunked = multiline_digit.map { |line| line.chars.each_slice(3).to_a }.transpose
  chunked.each { |digit| digits << DIGIT_DICTIONARY[digit.flatten.join] ||= "?" }
  digits
end
multiline_digit = [" _  _  _  _  _  _  _  _  _ ", "| || || || || || || || || |", "|_||_||_||_||_||_||_||_||_|"]

  # Maps the array of three-line digits into an array of nine-line strings:
def generate_digit_strings(cleaned_multiline_digits)
  cleaned_multiline_digits.map do |multiline_digit|
    convert_to_number_chars(multiline_digit)
  end
end



# ---------------------------------------------------------------------------- #
#      Just a happy little place to manually test my initial algorithms.       #
# ---------------------------------------------------------------------------- #
parsed = parse_txt_file("test_digits_with_errors.txt")
separated = separate_digit_lines(parsed)
cleaned = clean_digit_lines(separated)
converted = generate_digit_strings(cleaned)

puts "Gross:"
puts cleaned
puts "\n______________\n\n"
puts "Beautiful:\n\n"
puts converted