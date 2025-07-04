class Calculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    numbers = numbers.scan(/-?\d+/).map(&:to_i).join(",")
    num_list = numbers.split(delimiter).map(&:to_i)
    negatives = num_list.select { |n| n < 0 }

    raise "Error: negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?

    num_list.sum
  end
end
