require_relative 'lib/banky'

# ---------------------------------------------------------------------------- #
#      Just a happy little place to manually test my initial algorithms.       #
# ---------------------------------------------------------------------------- #

parsed = parse_txt_file("data/test_digits_with_errors.txt")
separated = separate_digit_lines(parsed)
cleaned = clean_digit_lines(separated)
converted = generate_digit_strings(cleaned)


puts cleaned
puts "\n______________\n\n"
puts converted