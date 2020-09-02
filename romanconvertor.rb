def fromRoman(roman_number)
  roman_array = roman_number.split('')
  character_map = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000,
  }

  if roman_number =~ /[^IVXLCDM]/
    raise TypeError
  else
    arabic_total = 0

    iterator = 0
    loop do
      start_arabic_value = character_map[roman_array[iterator]]

      if iterator + 1 < roman_array.length
        next_arabic_value = character_map[roman_array[iterator + 1]]

        if start_arabic_value >= next_arabic_value
          arabic_total += start_arabic_value
        else
          arabic_total += next_arabic_value - start_arabic_value
          iterator += 1
        end
      else
        arabic_total += start_arabic_value
      end

      iterator += 1
      if iterator >= roman_array.length
        break
      end
    end

    arabic_total
  end
end

def toRoman(arabic_number)
  if !(arabic_number <= 0 || arabic_number > 3999)
    roman_number = ''
    character_map = {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I'
    }

    character_map.each_with_index do |(key, value)|
      while arabic_number >= key
        roman_number += value
        arabic_number -= key
      end
    end
  else
    raise RangeError
  end

  roman_number
end
