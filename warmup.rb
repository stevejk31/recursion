# def range(min, max)
#   return [] if min > max
#   return [max] if min == max
#   range(min, max-1) << max
#   #range(1,1) [1] << max =2
# end


#2 1 = >[]
#1 1 => [1]
#1 2 => [1,2]
#[2,1]


def range(min, max)
  return [] if min > max
  return [max] if min == max
  range(min+1, max).unshift(min)
  #range(1,1) [1] << max =2
end


def sum(array)
  return nil if array.empty?
  return array.last if array.count == 1
  copy = array.dup
  copy.pop + sum(copy)
end

# def exp (base, power)
#   return 1 if power == 0
#   return base if power == 1
#   base * exp(base, power-1)
# end

def exp (base, power)
  return 1 if power == 0
  return base if power == 1
  if power % 2 == 1
    base * ( exp( base, (power - 1) / 2) ** 2)
  else
    exp(base, power / 2) ** 2
  end
end

#[[3]]
class Array
  def deep_dup
    re_array = []
    self.each do | el |
      unless el.is_a?(Array)
        re_array.push(el)
      else
        re_array << (el.deep_dup)
      end
    end
    return re_array
  end
end

def fib(num)
  return [] if num == 0
  return [0] if num == 1
  return [0,1] if num == 2
  previous_fib = fib(num-1)
  previous_fib << previous_fib.last + previous_fib[-2]
end

def fib_it(num)
  return [] if num == 0
  return [0] if num == 1
  result = [0,1]
  (num - 2).times do
    result << result[-1] + result[-2]
  end
  result
end
# assumed that array is sorted and > 3 elements
#no dupes in array
def bsearch(array, target)
  return nil if array.length == 0
  middle_point = array.length/2
  if array[middle_point] == target
    middle_point
  elsif target > array[middle_point]
    searched = bsearch(array[middle_point+1..-1],target)
    searched && 1 + middle_point + searched
  else
    bsearch(array[0...middle_point],target)
  end
end

def merge_sort(array)
  return array if array.length <= 1
  left = array[0...array.length/2]
  right = array[array.length/2..-1]
  left_sorted = merge_sort(left)
  right_sorted = merge_sort(right)
  merge(left_sorted, right_sorted)
end

# l = [1,3]
# r = [2,5]
def merge(left, right)
  re_array = []
  while !left.empty? && !right.empty?
    if left.first < right.first
      re_array << left.shift
    else
      re_array << right.shift
    end
  end
  re_array.concat(left).concat(right)
end

=begin
def subsets(array)
  return [[]] if array.empty?
  if array.length == 1
    element_array = array.pop
    subsets(array) << [element_array]
  elsif array.length == 2
    array.length.times do |i|
      temp_array = array.dup
      subsets(temp_array.delete(i)) << array
    end
    temp = array.deep_dup
    array.length.times do | index |
      array.unshift()
    end

  # else
  #   array.length.times do |idx|
  #
  #   end
  #
  end
end
=end
# subset([1]) => [[],[1]]
# => subset([])[1]


#
def subsets(array)
  return [[]] if array.empty?
  if array.length == 1
    element_array = array.pop
    subsets(array) << [element_array]
  else
    addition_to_sets = array.pop
    #puts array
    returned_array = subsets(array)
    added_array = returned_array.map do | set |
      set.dup << addition_to_sets
    end
    returned_array.concat(added_array)
  end
end
def subsets_it(array)

end

def helper_subset(array)
  re_array = []
  array.length.times do |i|
    temp_array = array.dup.delete_at(i)
    re_array << temp_array
  end
  re_array
end

def make_change(target, coins)
  coins.sort!
  return [] if target == 0
  while target < coins.last
    coins.pop
  end
  coin_used = coins.last
  make_change( target - coin_used, coins) + [coin_used]
end

# def make_change(target, coins)
#   #coins.sort!.reverse
#   coin_purse =[]
#   return [] if target == 0 || coins.count == 0
#   if target > coins.first
#     coin_used = coins.first
#     target -= coin_used
#     coin_purse << coin_used
#     coin_purse.concat(make_change(target, coins))
#   else
#     coins.shift
#     coin_purse = make_change(target, coins)
#   end
#   coin_purse
# end
# def make_change(target, coins)
#   #coins.sort!
#   return [] if target == 0
#   coin_used = coins.first
#   if coins == coins.sort.reverse
#     coins << (coins.shift)
#
#     make_change( target - coin_used, coins) + [coin_used]
#   end
#   make_change( target % coin_used, coins) + [coin_used] * (target / coin_used)
#   coins << (coins.shift)
# end
