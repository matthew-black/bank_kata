# A couple of interesting methods from this challenge:
### convert_to_numbers
The first problem of the challenge was to convert this input:
```
 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
|_||_||_||_||_||_||_||_||_|

 _  _  _  _  _  _  _  _  _ 
|_||_||_||_||_||_||_||_||_|
 _| _| _| _| _| _| _| _| _|

    _  _     _  _  _  _  _ 
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
```
  into this output:
  ```
  888888888
  999999999
  123456789
  ```
---
After writing methods to read from a .txt file and bundle each of these
nine-digit account numbers into subarrays, I needed a method that could
convert a single account number (made of spaces, underscores, and pipes)
into actual numbers.

So, the #convert_to_numbers method takes the following as input:
```
["    _  _     _  _  _  _  _ ",
 "  | _| _||_||_ |_    |_||_|",
 "  ||_  _|  | _||_|  ||_| _|"]
```

Here's the method itself:
```
def convert_to_numbers(multiline_digit)
  chunked = multiline_digit.map { |line| line.chars.each_slice(3).to_a }.transpose
  numbers = chunked.map { |digit| DIGIT_DICTIONARY[digit.flatten.join] ||= "?" }
  numbers.join('')
end
```

The first line of code inside the method uses #each_slice 
and #transform to further divide the input, then rotate it so that 
the element at index 0 would contain the '1' digit:
```
[[" ", " ", " "], [" ", " ", "|"], [" ", " ", "|"]],
```
and the element at index 1 would contain the '2' digit:
```
[[" ", "_", " "], [" ", "_", "|"], ["|", "_", " "]],
```
etc...

The next line of the method uses a hash (digit_dictionary.rb) to look up
which number corresponds to each of the subarrays. If no
corresponding digit is found inside the hash, it uses the ||= operator
to insert a question mark.

---
### calculate_checksum
The other method I'll point out is used to calculate a checksum, in order to
verify that an account number is valid.

Here's the formula for calculating the checksum (provided by the kata instructions):
```
account number:  3  4  5  8  8  2  8  6  5
position names:  d9 d8 d7 d6 d5 d4 d3 d2 d1


checksum calculation:

(d1 + 2\*d2 + 3\*d3 +..+ 9\*d9) mod 11 = 0
```

In ruby, you can use [-1] to access the last item in an array, [-2] to access the next-to-last
item in an array, etc. To carry out this calculation, I learned a new trick. It's possible to combined #each_with_index and #inject
so that the inject block has access to the index of the current array element that's being passed into the block as 'digit'.

```
def calculate_checksum(digits)
  digits.each_with_index.inject(0) do |sum, (digit, i)|
    current_index = i + 1
    sum + (current_index * digits[-current_index])
  end
end
```
