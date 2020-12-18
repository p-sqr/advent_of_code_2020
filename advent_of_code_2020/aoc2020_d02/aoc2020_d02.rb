def aoc2020_d02_1
  @valid_passwords = 0

  file = File.open('aoc2020_d02_input.txt')

  file.each do |row|

    #    print row
    row_array = row.split(' ')
    #    print row_array
    ## Get min & max

    minmax = row_array[0]
    chck_lttr = row_array[1]
    password = row_array[2]

    min_and_max = minmax.split('-')
    #    print min_and_max
    min = min_and_max[0]
    max = min_and_max[1]
    #    puts "min = #{min}, max = #{max}"

    check_letter = chck_lttr.chomp(':')
    #    puts "check letter = #{check_letter}"

    count_in_password = password.count(check_letter)
    #    puts "number of instances of '#{check_letter}' in #{password} is #{count_in_password}"

    if count_in_password >= min.to_i && count_in_password <= max.to_i
      #      puts "password is valid"
      @valid_passwords += 1
    else
      #      puts "password is invalid"
    end
    # puts '--------------------------------'
  end
  puts "number of valid passwords = #{@valid_passwords}"
end

# aoc2020_d02_1

def aoc2020_d02_2
  @valid_passwords = 0
  file = File.open('aoc2020_d02_input.txt')

  file.each do |row|

    row_split = row.split(' ')

    positions = row_split[0]
    pos_split = positions.split('-')
    index1 = (pos_split[0].to_i) - 1
    index2 = (pos_split[1].to_i) - 1

    check_letter = row_split[1].chomp(':')

    password = row_split[2]

    instances_in_password = 0
    instances_in_password += 1 if password[index1] == check_letter
    instances_in_password += 1 if password[index2] == check_letter

    #   puts "instances of #{check_letter} in characters #{index1 + 1} and #{index2 + 1} of #{password} = #{instances_in_password}"

    @valid_passwords += 1 if instances_in_password == 1

  end
  puts "Number of valid passwords = #{@valid_passwords}"
end

aoc2020_d02_2