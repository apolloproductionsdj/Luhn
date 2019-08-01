class Luhn
  
  def initialize(number)
    @number = number
  end

  def is_valid?
    @indiv_digits = individual_digits
    @doubled = doubled_every_second_digit_from_end     
    validate_the_sum
  end

  private

  def individual_digits
    @number.to_s.chars.map(&:to_i)
  end

  def doubled_every_second_digit_from_end
    @indiv_digits.reverse    
    .map.with_index { |x, i| i.odd? ? x * 2 : x } # Double every other digit
    .map { |x| x > 9 ? x - 9 : x }  # If > 9, subtract 9 (same as adding the digits)
    
  end
    

  def validate_the_sum
    @doubled.inject(:+) % 10 == 0 
  end

end

