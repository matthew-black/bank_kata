require_relative 'digit_dictionary'

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

  # Maps the array of three-line digits into an array of nine-line strings:
def generate_digit_strings(cleaned_multiline_digits)
  cleaned_multiline_digits.map do |multiline_digit|
    convert_to_number_chars(multiline_digit)
  end
end
