require_relative '../lib/validator'

describe 'Validator' do
  valid_digits = "457508000"
  illegible_digits = "4575?8000"
  invalid_digits = "457508123"
  digit_array = [4,5,7,5,0,8,0,0,0]
  digit_strings = ["000000000",
                   "11?111111",
                   "99999?999",
                   "123456789",
                   "123498789"]

  describe '#convert_to_integers' do
    it 'converts a nine-digit string to a nine-integer array' do
      expect(convert_to_integers(valid_digits)).to eq digit_array
    end
  end

  describe '#calculate_checksum' do
    it 'returns the checksum for a given account number' do
      expect(calculate_checksum(digit_array)).to eq 187
    end
  end

  describe '#annotate_account_number' do
    it 'returns just the digit string when given a valid account number' do
      expect(annotate_account_number(valid_digits)).to eq valid_digits
    end

    it 'appends " ILL" to the digit string if a digit is illegible' do
      expect(annotate_account_number(illegible_digits)).to eq illegible_digits + " ILL"
    end

    it 'appends " ERR" to the digit string when given an invalid account nummber' do
      expect(annotate_account_number(invalid_digits)).to eq invalid_digits + " ERR"
    end
  end

  describe '#validate_account_numbers' do
    it 'accurately annotates an array of digit strings' do
      validated = validate_account_numbers(digit_strings)
      expect(validated[0]).to eq "000000000"
      expect(validated[1]).to eq "11?111111 ILL"
      expect(validated[2]).to eq "99999?999 ILL"
      expect(validated[3]).to eq "123456789"
      expect(validated[4]).to eq "123498789 ERR"
    end
  end

end
