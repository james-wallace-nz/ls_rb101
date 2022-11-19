def remove_evens!(arr)
  arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1, 1, 2, 3, 4, 6, 8, 9])

def remove_evens2!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens2!([1, 1, 2, 3, 4, 6, 8, 9])
