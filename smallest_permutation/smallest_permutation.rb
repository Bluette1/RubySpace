def find_smallest(n)
    str_res = ""
    array_n = [0] * 10
    while n > 0
      idx = n % 10
      array_n[idx] += 1
      n = n / 10
    end
    if array_n[0] > 0
      i = 1
      while array_n[i] == 0
        i += 1
      end
      str_res = i.to_s
      array_n[i] -= 1
    end
  for i in 0..9
    if array_n[i] > 0
        while array_n[i] > 0
          str_res << i.to_s
          array_n[i] -= 1
        end
    end    
  end
  return str_res
end
   
puts find_smallest(846903)