
class Array
  def my_each(&prc)
    i = 0
    while i < self.length do
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    newArr = []
    self.my_each  { |val| newArr << val if prc.call(val) }
    newArr
  end
  
  def my_reject(&prc)
    newArr = []
    self.my_each  { |val| newArr << val if !prc.call(val) }
    newArr
  end

  def my_any?(&prc)
    self.my_each  { |val| return true if prc.call(val) }
    false
  end

  def my_all?(&prc)
    self.my_each  { |val| return false if !prc.call(val) }
    true
  end
#   [[1] 2 3 [4,5,6]]
#   [1 [2 3] [4,5,6]]
  def my_flatten
    return [self[0]] if !self[0].is_a?(Array)
    return self[0] if self.length == 0
    p "#{self[0]}  #{self[1..-1]}"
    self[0].my_flatten + self[1..-1].my_flatten
  end
end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

=begin
p a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
# => 1
2
3
1
2
3

p return_value  # => [1, 2, 3]
=end



















