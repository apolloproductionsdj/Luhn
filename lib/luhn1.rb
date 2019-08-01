def luhn(card_no)
  card_no
    .to_s.chars      # Break into individual digits
    .map(&:to_i) # map each character to turn it into an integer. (&:to_i) is short for {|n| n.to_i}
    .reverse     # Start from the end
    .map.with_index { |x, i| i.odd? ? x * 2 : x } # Double every other digit, the odd digits by index based on 0 based
    .map { |x| x > 9 ? x - 9 : x }  # If > 9, subtract 9. If not just print x
    .inject(:+) % 10 == 0        # Add it all up and then Check if multiple of 10. (:+) is the same as {|total, n| total + n }
end


    l = luhn(4194560385008504) # 16 digits
    l1 = luhn(4194560385008505) # 16 digits
    l2 = luhn(377681478627336) # 15 digits
    l3 = luhn(377681478627337) # 15 digits

    p l
    p l1
    p l2
    p l3 
