require_relative '../lib/banky'

describe 'Banky' do
  digits = 'data/test_digits.txt'
  error_digits = 'data/test_digits_with_errors.txt'
  let (:parsed) { parse_txt_file(digits) }
  let(:separated) { separate_digit_lines(parsed) }
  test_subarray =  ["    _  _     _  _  _  _  _ ",
                    "  | _| _||_||_ |_   ||_||_|",
                    "  ||_  _|  | _||_|  ||_| _|"]

  describe '#parse_txt_file' do
      it 'returns an array' do
        expect(parse_txt_file(digits)).to be_an_instance_of(Array)
      end

      it 'returns an array filled with strings' do
        def string_check(parsed)
          parsed.each do |element|
            if element.class != String
              return false
            end
          end
          true
        end
        expect(string_check(parsed)).to be true
      end
  end

  describe '#separate_digit_lines' do
      it 'returns an array' do
        expect(separate_digit_lines(parsed)).to be_an_instance_of(Array)
      end

      it 'returns an array where each subarray contains four strings' do
        expect(separate_digit_lines(parsed)[0].length).to eq 4
        expect(separate_digit_lines(parsed)[0][0]).to be_an_instance_of(String)
      end
  end

  describe '#clean_digit_lines' do
    it 'returns an array' do
      expect(clean_digit_lines(separated)).to be_an_instance_of(Array)
    end

    it 'returns an array where each subarray contains three strings' do
      expect(clean_digit_lines(separated)[0].length).to eq 3
    end

    it 'ensures the first string in each subarray is not blank' do
      cleaned = clean_digit_lines(separated)
      def length_check(cleaned)
        cleaned.each do |subarray|
          if subarray[0].length != 27
            return false
          end
        end
        true
      end
      expect(length_check(cleaned)).to be true
    end
  end

  describe '#convert_to_number_chars' do
    it 'converts a three-line subarray to a nine-digit string' do
      expect(convert_to_number_chars(test_subarray)).to eq "123456789"
    end
  end

  describe '#generate_digit_strings' do

  end
end