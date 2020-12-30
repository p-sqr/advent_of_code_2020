def aoc2020_d08_1

  # acc = add number to accmltr
  # nop = no action, proceed to next instruction
  # jmp = move forwards/backwards by specified amount

  accmltr = 0
  file_array = []

  file = File.open("aoc2020_d08_input.txt", "r")

  file.each do |row|
    row_array = row.split(' ')
    file_array << [row_array[0], row_array[1].to_i]
  end
  #      puts file_array

  used_indexes = []
  current_index = 0
  #  puts file_array[current_index]

  while used_indexes.include?(current_index) == false
    puts "Current index = #{current_index}"
    used_indexes << current_index
    command = file_array[current_index][0]
    amount = file_array[current_index][1]
    # puts command
    # puts amount

    case command
    when 'acc'
      accmltr += amount
      current_index += 1
    when 'jmp'
      current_index += amount
    else
      current_index += 1
    end


  end

  print used_indexes
  puts
  puts used_indexes.size
  puts "Accumulator = #{accmltr}"


end

# aoc2020_d08_1


def aoc2020_d08_2
  ### This isn't quite right. Going to start again.
  current_index = 0
  file_array = []

  file = File.open("aoc2020_d08_example.txt", "r")
  lines = File.foreach(file).count

  file.each do |row|
    row_array = row.split(' ')
    file_array << [row_array[0], row_array[1].to_i]
  end

  # print file_array
  # puts
  # pp "File array size = #{file_array.size}"

  #  change_these = [0, 1, 2, 3, 4, 113, 241, 364, 365, 386, 387, 388, 389, 176, 177, 178, 179, 370, 371, 372, 373, 516, 517, 561, 562, 394, 395, 489, 11, 12, 13, 14, 15, 96, 97, 98, 99, 414, 415, 416, 417, 83, 84, 85, 86, 292, 293, 294, 78, 79, 80, 541, 542, 543, 544, 525, 609, 610, 611, 612, 88, 89, 90, 91, 92, 67, 166, 167, 168, 575, 576, 577, 156, 157, 158, 159, 483, 484, 485, 486, 487, 116, 117, 243, 244, 245, 246, 44, 452, 453, 546, 547, 7, 8, 335, 34, 35, 123, 124, 125, 126, 127, 300, 301, 302, 303, 304, 257, 258, 259, 498, 499, 500, 279, 280, 495, 357, 358, 359, 421, 422, 147, 148, 149, 150, 151, 571, 602, 603, 604, 462, 463, 464, 617, 618, 619, 620, 621, 189, 190, 191, 192, 193, 597, 598, 599, 296, 297, 298, 551, 355, 136, 137, 227, 219, 220, 221, 512, 513, 514, 410, 434, 435, 436, 437, 438, 20, 21, 375, 376, 347, 348, 349, 350, 181, 182, 183, 104, 105, 106, 107, 342, 196, 197, 198, 199, 519, 520, 521, 251, 252, 253]
  change_these = (0..(lines - 1)).to_a
  #change_these = [0, 1, 2, 3, 4, 5, 6, 7, 8]


  change_these.each do |change_index|
    accmltr = 0
    go_to_next_index = false
    used_indexes = []

    cmd = file_array[change_index][0]
    amt = file_array[change_index][1]

    case cmd

    when 'jmp'
      file_array[change_index][0] = 'nop'
    when 'nop'
      file_array[change_index][0] = 'jmp' if amt != 0
    end

    while current_index < lines - 1

      # puts "Used indexes"
      # print used_indexes
      # puts

      #     raise "Infinite loop at index #{current_index}" if used_indexes.include?(current_index)
      go_to_next_index == true if used_indexes.include?(current_index)

      if go_to_next_index == false
        used_indexes << current_index
        #
        # pp "Current index = #{current_index}"
        # pp file_array[current_index]

        used_indexes << current_index
        command = file_array[current_index][0]
        amount = file_array[current_index][1]

        # puts "command = #{command}"
        # puts "number = #{amount}"

        puts "Currrent index: #{current_index}"
        case command
        when 'acc'
          accmltr += amount
          current_index += 1
        when 'jmp'
          current_index += amount
        else
          current_index += 1
        end
        #      puts "Current index changed to: #{current_index}"
      end
    end
    file_array[change_index][0] = cmd
    puts "Accumulator = #{accmltr}"
    accmltr = 0
  end


  # print used_indexes
  # puts
  # puts used_indexes.size
end

# aoc2020_d08_2

def aoc2020_d09_2_v2

  file = File.open("aoc2020_d08_input.txt", "r")
  lines = File.foreach(file).count

  file_array = []

  file.each do |row|
    row_array = row.split(' ')
    file_array << [row_array[0], row_array[1].to_i]
  end
  # print file_array
  # puts
  @array_size = file_array.size

  # array_indexes = [0,7]
  array_indexes = (0..(@array_size - 1)).to_a

  # Go through the file array, change one element at a time
  # Run the array. Escape if it turns into an infinte loop.
  # Stop if last line reached.
  # Output value of accumulator

  array_indexes.each do |my_index|
    #    puts "My index = #{my_index}"
    @accmltr = 0

    # Change the command from jmp to nop regardless of the value with it
    # Change nop to jmp only if the value is not 0

    cmd = file_array[my_index][0]
    amt = file_array[my_index][1]

    case cmd

    when 'jmp'
      file_array[my_index][0] = 'nop'
    when 'nop'
      file_array[my_index][0] = 'jmp' if amt != 0
    end

    # Test for infinite loop

    current_index = 0
    commands = [0]
    infinite_loop_started = false

    until infinite_loop_started == true

      command = file_array[current_index][0]
      amount = file_array[current_index][1]

      case command
      when 'acc'
        @accmltr += amount
        current_index += 1
      when 'jmp'
        current_index += amount
      else
        current_index += 1
      end

      # Indexes start at 0
      # File size starts at 1
      # If the next index to be used equals the file size the current index must be the last one in the array.

      if current_index == file_array.size
        puts "Last command reached"
        puts @accmltr
        return
      end

      infinite_loop_started = true if commands.include?(current_index) == true
      commands << current_index
      # puts "Current index = #{current_index}"
      # puts "Command indexes already used = #{commands}"
      # puts "infinite loop is #{infinite_loop_started}"
    end

    # Reset changed array element to its original value
    file_array[my_index][0] = cmd
    #    puts @accmltr
  end

end

aoc2020_d09_2_v2
