# THE KARATSUBA ALGORITHM (Karatsuba multiplication)

###########################################################################################################################

class Karatsuba

  def self.product(x, y)

    # convert input data to strings
    x_string = x.to_s
    y_string = y.to_s

    # define the longest string and set it up as 'n'
    n = [x_string.length, y_string.length].max
    # puts
    # puts("n = #{n}")

    # return simple product if there are one-digit numbers
    if n == 1
      # puts("return #{x} * #{y} = #{x * y}")
      return x * y
    end

    # middle = (n.to_f/2).floor
    middle = (n.to_f/2).ceil

    # define a, b, c, d
    if n > x_string.length
      a = 0
      b = x
    else
      a = x_string[0...middle].to_i
      b = x_string[(middle)...x_string.length].to_i
    end

    if n > y_string.length
      c = 0
      d = y
    else
      c = y_string[0...middle].to_i
      d = y_string[(middle)...y_string.length].to_i  
    end

    #print out defined attributes
    # puts '=========='
    # puts "x = #{x}, y = #{y}"
    # puts("n/2: #{n.to_f/2} => middle = #{middle}")
    # puts("x length: #{x_string.length}, y length: #{y_string.length}")
    # puts("a,b,c,d: #{a},#{b},#{c},#{d}")

    # recursive calculations
    ac = product(a, c)
    bd = product(b, d)
    # puts "a + b = #{a} + #{b} = #{a + b}"
    # puts "c + d = #{c} + #{d} = #{c + d}"
    gauss_trick = product(a + b, c + d)

    # puts '=========='
    # puts("ac - #{ac}")
    # puts("bd - #{bd}")
    # puts("(a+b) * (c+d) = #{gauss_trick}")
    # puts("(ad + bc) = #{gauss_trick} - #{ac} - #{bd} = #{gauss_trick - ac - bd}")
    gauss_trick = gauss_trick - ac - bd
    # puts("a+b = #{a+b}, c+d = #{c+d}")

    # the power must be always even, so make it this way
    pow = n / 2
    pow = pow * 2

    # puts '========== ac * 10 ^ n ===== (ad + bc) * 10 ^ (n/2) ===== bd'
    # puts ac * (10 ** pow)
    # puts gauss_trick * (10 ** (pow / 2)) 
    # puts bd
    # puts

    # the main calculation by Karatsuba method
    return ac * (10 ** pow) + gauss_trick * (10 ** (pow / 2)) + bd

  end
end

###########################################################################################################################

# Input data:
x = 3141592653589793238462643383279502884197169399375105820974944592
y = 2718281828459045235360287471352662497757247093699959574966967627

# print out the result:
puts "\n X = #{x}"
puts " Y = #{y}"
puts "\n----------------------------------------------------------------------------------------------------------------------------------------"
puts " X * Y = #{Karatsuba.product(x,y)}"
puts "----------------------------------------------------------------------------------------------------------------------------------------\n"

#Output:8539734222673567065463550869546574495034888535765114961879601127067743044893204848617875072216249073013374895871952806582723184
