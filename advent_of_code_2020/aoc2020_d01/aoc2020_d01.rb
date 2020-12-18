require 'yaml'

def aoc2020_d01_1
  my_yaml_file = YAML.load(File.read('aoc2020_d01_input.yml'))
  yaml_array = my_yaml_file.split(' ')

  for i in 0..yaml_array.size - 1 do

    element1 = yaml_array[i]
    #   puts "index#{i} = #{my_element}"
    array_minus_el = yaml_array -= [element1]

    #    print array_minus_el
    #puts

    array_minus_el.each do |element2|
      #     puts element1.to_i + element2.to_i

      if element1.to_i + element2.to_i == 2020
        @number1 = element1.to_i
        @number2 = element2.to_i
        found_numbers = true
        break if found_numbers == true
      end
      break if found_numbers == true
    end

    yaml_array.insert(i, element1)
  end

  puts "numbers are #{@number1} and #{@number2}"
  puts "Product of 2 numbers = #{@number1 * @number2}"

end

# aoc2020_d01_1

def aoc2020_d01_2
  my_yaml_file = YAML.load(File.read('aoc2020_d01_input.yml'))
  yaml_array = my_yaml_file.split(' ')

  #  print yaml_array
  #  puts
  #  puts '==========================================='

  for n in 0..yaml_array.size - 1 do
    element1 = yaml_array[n]
    #    puts "element1 = #{element1}"

    array_minus_el1 = yaml_array -= [element1]
    #    print array_minus_el1
    #    puts

    for i in 0..array_minus_el1.size - 1 do

      element2 = array_minus_el1[i]
      array_minus_el1_and_el2 = array_minus_el1 -= [element2]
      #   puts "element2 = #{element2}"
      #print array_minus_el1_and_el2
      #puts

      for x in 0..array_minus_el1_and_el2.size - 1 do
        element3 = array_minus_el1_and_el2[x]

        if element1.to_i + element2.to_i + element3.to_i == 2020
          @number1 = element1.to_i
          @number2 = element2.to_i
          @number3 = element3.to_i
        end

      end

      array_minus_el1.insert(i, element2)
    end

    yaml_array.insert(n, element1)
    #   print yaml_array
    #puts
    #puts '---------------------------------------'
  end

  puts "number1 = #{@number1}"
  puts "number2 = #{@number2}"
  puts "number3 = #{@number3}"

  puts "product of 3 numbers that total 2020 = #{@number1 * @number2 * @number3} "

end

aoc2020_d01_2