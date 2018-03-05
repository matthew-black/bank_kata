require_relative '../lib/banky'


describe 'Banky' do
  digits = 'data/test_digits.txt'
  error_digits = 'data/test_digits_with_errors.txt'
  let (:parsed) { parse_txt_file(digits) }
  let(:separated) { separate_digit_lines(parsed) }
  let(:cleaned) { clean_digit_lines(separated) }
  let(:generated) { generate_number_strings(cleaned) }
  test_subarray =  ["    _  _     _  _  _  _  _ ",
                    "  | _| _||_||_ |_    |_||_|",
                    "  ||_  _|  | _||_|  ||_| _|"]

  describe '#parse_txt_file' do
      it 'returns an array' do
        expect(parse_txt_file(digits)).to be_an_instance_of(Array)
      end

      it 'that is filled with strings' do
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

      it 'where each subarray contains four strings' do
        expect(separate_digit_lines(parsed)[0].length).to eq 4
        expect(separate_digit_lines(parsed)[0][0]).to be_an_instance_of(String)
      end
  end

  describe '#clean_digit_lines' do
    it 'returns an array' do
      expect(clean_digit_lines(separated)).to be_an_instance_of(Array)
    end

    it 'where each subarray contains three strings' do
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

  describe '#convert_to_numbers' do
    it 'converts a three-line subarray to a nine-digit string' do
      expect(convert_to_numbers(test_subarray).length).to eq 9
      expect(convert_to_numbers(test_subarray)).to be_an_instance_of(String)
    end

    it 'replaces unrecognized characters with a question mark' do
      expect(convert_to_numbers(test_subarray)[6]).to eq "?"
    end
  end

  describe '#generate_number_strings' do
    it 'returns an array' do
      expect(generate_number_strings(cleaned)).to be_an_instance_of(Array)
    end

    it 'that is filled with strings' do
      def string_check(parsed)
        parsed.each do |element|
          if element.class != String
            return false
          end
        end
        true
      end
      expect(string_check(generated)).to be true
    end

    it 'where each string contains nine characters' do
      def length_check(array)
        array.each do |string|
          if string.length != 9
            return false
          end
        end
        true
      end
      expect(length_check(generated)).to be true
    end
  end
end