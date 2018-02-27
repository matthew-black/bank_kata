require_relative '../banky'

describe "Banky" do
  digits = 'test_digits.txt'
  error_digits = 'test_digits_with_errors.txt'
  let (:parsed) { parse_txt_file(error_digits) }

  describe '#parse_txt_file' do
      it 'returns an array' do
        expect(parse_txt_file(error_digits)).to be_an_instance_of(Array)
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
end