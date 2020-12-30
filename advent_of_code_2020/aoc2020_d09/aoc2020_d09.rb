def aoc2020_d09(preamble_length)

  # Read the input file and turn it into an array of numbers, removing the newline characters as well.
  file_array = []

  file = File.open("aoc2020_d09_input.txt", "r")

  file.each do |row|
    file_array << row.gsub("\n", '').to_i
  end
  array_size = file_array.size
  array_indexes = (0..(array_size - 1)).to_a

  # Part 1
  preamble = preamble_length

  #Start at the preamble value, finish at the last index.
    for x in preamble..(array_size - 1) do
    # put all the indexes from the current index plus the preceding 'preamble' amount of indexes in an array
    selection = ((x - preamble)..x).to_a

    #Create empty array each time the loop is run
    selection_from_file_array = []

    #Because there are no matches yet.
    at_least_one_match = false

    # Add the elements to 'selection_from_file_array' from 'file_array' for each index in 'selection'
    selection.map { |my_index| selection_from_file_array << file_array[my_index] }

    # Get the last element (i.e. the one we're trying to find numbers that add up to it)
    selec_fil_arr_last = selection_from_file_array[preamble]
    # Remove it from the array, so the rest of the array can be dealt with without having to work around the last element
    selection_from_file_array.delete_at(preamble)

    #    selection_from_file_array.combination(2).to_a {|a, b| puts "#{a}, #{b}, total = #{a + b}"}

    # split the arrays into combinations of elements.
    # See https://apidock.com/ruby/v2_5_5/Array/combination
    arrays = selection_from_file_array.combination(2).to_a

    # puts "arrays"
    # print arrays
    # puts
    # puts "arrays end"
    # puts "selec_fil_arr_last = #{selec_fil_arr_last}"

    # Iterate over each array and set 'at_least_one_match' to true if the total of any pair of numbers equals the last element in the array
    arrays.each do |one_array|
      a = one_array[0]
      b = one_array[1]
      # puts "a + b = #{a + b}"
      at_least_one_match = true if a + b == selec_fil_arr_last
      # puts "#{a + b} = #{preamble}" if a + b == preamble
    end

    # Output the last element in the array if no combination of numbers add up to it.
    #    puts "No combination of previous #{preamble} numbers adds up to #{selec_fil_arr_last}" if at_least_one_match == false
    invalid_number = selec_fil_arr_last if at_least_one_match == false
  end

  # Part 2

  #  puts "invalid number = #{invalid_number}"

  # Iterate over an array of the indexes made when the input file was read.
  array_indexes.each do |my_index|

    sum_array = []

    # Add each index from the current one to the last into an array, one at a time
    # e.g. if the array is [1, 2, 3, 4, 5] and 'my_index' is currently 2
    # sum_array would go [3] then [3,4] then [3,4,5]
    for x in my_index..(array_size - 1)

      sum_array << file_array[x]
      # print "'sum_array' = #{sum_array}"
      # puts
      # puts "Sum of array 'sum_array' = #{sum_array.sum}"

      #Add the numbers in the sum_array and see if the total matches the invalid_number which is the output from Part 1
      if sum_array.sum == invalid_number
        # print "'sum_array' = #{sum_array}"
        # puts
        # puts "Smallest number in the aray is #{sum_array.sort.first}"
        # puts "Largest number in the array is #{sum_array.sort.last}"
        puts "Total of smallest and largest numbers in the array = #{sum_array.sort.first + sum_array.sort.last}"
        return

      end
    end
  end
end

#aoc2020_d09(25)


def aoc2020_d09_no_comments(preamble_length)

  file_array = File.readlines('aoc2020_d09_input.txt').map(&:chomp).map(&:to_i)

  array_size = file_array.size
  array_indexes = (0..(array_size - 1)).to_a

  # Part 1
  preamble = preamble_length

  for x in preamble..(array_size - 1) do

    selection = ((x - preamble)..x).to_a
    selection_from_file_array = []

    at_least_one_match = false

    selection.map { |my_index| selection_from_file_array << file_array[my_index] }

    selec_fil_arr_last = selection_from_file_array.last
    selection_from_file_array.pop

    arrays = selection_from_file_array.combination(2).to_a

    arrays.each do |one_array|
      a = one_array[0]
      b = one_array[1]
      at_least_one_match = true if a + b == selec_fil_arr_last
    end
    invalid_number = selec_fil_arr_last if at_least_one_match == false
  end

  # Part 2
  array_indexes.each do |my_index|

    sum_array = []

    for x in my_index..(array_size - 1)

      sum_array << file_array[x]

      if sum_array.sum == invalid_number
        puts "Total of smallest and largest numbers in the array = #{sum_array.sort.first + sum_array.sort.last}"
        return
      end

    end
  end
end

aoc2020_d09_no_comments(25)
