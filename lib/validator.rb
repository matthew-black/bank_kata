
def convert_to_integers(digit_string)
  # Same as '.map { |char| char.to_i }'
  digit_string.chars.map(&:to_i)
end

def calculate_checksum(digits)
  digits.each_with_index.inject(0) do |sum, (digit, i)|
    current_index = i + 1
    sum + (current_index) * digits[-current_index]
  end
end

def annotate_account_number(digit_string)
  if digit_string.include?("?")
      digit_string + " ILL"
    else
      digits = convert_to_integers(digit_string)
      checksum = calculate_checksum(digits)
      if checksum % 11 == 0
        digit_string
      else
        digit_string + " ERR"
      end
    end
end

def validate_account_numbers(digit_strings)
  mapped = digit_strings.map do |digit_string|
    annotate_account_number(digit_string)
  end
end