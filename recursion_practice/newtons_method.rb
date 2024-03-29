# This will return the square root approximation of a given number to a
# certain degree of accuracy.Newton's method achieves quadratic convergence
# fairly quickly, using linear approximation (delta y / delta x is approximately eq. to
#  dy/dx for very small intervals).
def sqrt(num, guess)
  sqrt_newton_mthd_iterative(num, guess)
  sqrt_newton_mthd_iterative(num, guess)
  sqrt_newton_mthd_recursive(num, guess)
  sqrt_newton_mthd_recursive(num, guess)
end

def sqrt_newton_mthd_iterative(number, guess = 2.5, error = 0.000001)
  guessed_square = guess**2
  abs_error = (guessed_square - number).abs

  while abs_error > error
    fx = guessed_square - number
    deriv_fx = 2 * guess

    guess -= (fx / deriv_fx)
    guessed_square = guess**2
    abs_error = (guessed_square - number).abs
  end
  guess
end

def sqrt_newton_mthd_recursive(number, guess = 2.5, error = 0.000001)
  guessed_square = guess**2
  abs_error = (guessed_square - number).abs
  if abs_error <= error
    guess
  else

    fx = guessed_square - number
    deriv_fx = 2 * guess

    guess -= (fx / deriv_fx)
    sqrt_newton_mthd_recursive(number, guess)
  end
end

def sqrt_recursive(number, min_interval, max_interval)
  min_interval += 0.000001 if min_interval.zero? # To prevent division by zero
  guessed_square = min_interval**2
  abs_error = (guessed_square - number).abs

  if abs_error <= 0.000001
    min_interval.to_int
  else
    fx = guessed_square - number
    deriv_fx = 2 * min_interval

    min_interval -= (fx / deriv_fx)
    sqrt_recursive(number, min_interval, max_interval)
  end
end

def sqrt_recursive_interval(number, min_interval, max_interval)
  min_interval += 0.000001 if min_interval.zero? # To prevent division by zero

  if (min_interval**2 - number).abs < 0.000001
    min_interval.to_int
  elsif (max_interval**2 - number).abs < 0.000001
    max_interval.to_int
  else
    min_interval = calculate_new_rt(min_interval, number)
    max_interval = calculate_new_rt(max_interval, number)
    sqrt_recursive_interval(number, min_interval, max_interval)
  end
end

def calculate_new_rt(root, number)
  guessed_square = root**2
  fx = guessed_square - number
  deriv_fx = 2 * root
  root - (fx / deriv_fx)
end

puts sqrt(25, 2.8)
puts sqrt(7056, 83.5)
puts sqrt(25, 2.5)
puts sqrt(7056, 70.1)
puts sqrt_recursive(25, 0, 25)
puts sqrt_recursive_interval(25, 0, 25)
