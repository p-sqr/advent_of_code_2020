def aoc2020_d03_1

  @num_of_trees = 0

  file = File.open("aoc2020_d03_input.txt", "r")
  line_count = file.readlines.size
  #  puts line_count

  lines = IO.readlines(file)

  # Start in the 1st column
  y = 0

  for i in 1..line_count - 1 do
    # Because File references things starting at 0
    line1_index = i - 1
    line2_index = i

    # Remove the newLine characters
    line1 = lines[line1_index].gsub(/^#{$/}/, "").gsub(/#{$/}$/, "")
    line2 = lines[line2_index].gsub(/^#{$/}/, "").gsub(/#{$/}$/, "")

    # puts "line1 = text file line #{line1_index + 1}: #{line1}"
    # puts "line2 = text file line #{line2_index + 1}: #{line2}"

    column_count = line1.length
    column_indexes = column_count - 1

    #    puts "number of columns = #{column_count}"
    #    puts "last columin index = #{column_indexes}"

    # Move along 3 columns
    y += 3
    #    puts "y (as an index) = #{y}"

    character_to_check = line2[y]
    #    puts "Character at line #{line2_index + 1} index #{y} is #{character_to_check}"

    # puts 'tree' if character_to_check == '#'
    # puts "Not a tree" if character_to_check == '.'
    @num_of_trees += 1 if character_to_check == '#'

    remaining_indexes = column_indexes - y
    #    puts "Remaining indexes = #{remaining_indexes}"
    if remaining_indexes < 3

      # if remaining_columns == 2
      #   y = -1
      # elsif remaining_columns == 1
      #   y = -2
      # else
      #   y = 0
      # end

      case remaining_indexes
      when 2
        y = -3
      when 1
        y = -2
      else
        y = -1
      end

    end
    #    puts "Next index = #{y + 3}"
    #    puts '--------------------------'
  end
  puts "Number of trees = #{@num_of_trees}"
end

# aoc2020_d03_1

def aoc2020_d03_2

  file = File.open("aoc2020_d03_input.txt", "r")
  line_count = file.readlines.size
  #  puts line_count

  lines = IO.readlines(file)

  moves = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

  moves.each do |mvs|

    mvs_r = mvs[0]
    mvs_d = mvs[1]

    # Start with no trees
    @num_of_trees = 0
    @trees_per_run = []
    # Start in the 1st column
    y = 0

    row_number = 1
    last_row_to_move_from = line_count - mvs_d

    while row_number <= last_row_to_move_from

      # Because File references things starting at 0
      line1_index = row_number - 1
      line2_index = line1_index + mvs_d

      # Remove the newLine characters
      line1 = lines[line1_index].gsub(/^#{$/}/, "").gsub(/#{$/}$/, "")
      line2 = lines[line2_index].gsub(/^#{$/}/, "").gsub(/#{$/}$/, "")

      # puts "line1 = text file line #{line1_index + 1}: #{line1}"
      # puts "line2 = text file line #{line2_index + 1}: #{line2}"

      column_count = line1.length
      column_indexes = column_count - 1

      # puts "number of columns = #{column_count}"
      # puts "last columin index = #{column_indexes}"

      # Move along 'mvs_r' columns
      y += mvs_r
      #      puts "y (as an index) = #{y}"

      character_to_check = line2[y]
      #      puts "Character at line #{line2_index + 1} index #{y} is #{character_to_check}"

      # puts 'tree' if character_to_check == '#'
      # puts "Not a tree" if character_to_check == '.'
      @num_of_trees += 1 if character_to_check == '#'

      remaining_indexes = column_indexes - y
      #      puts "Remaining indexes = #{remaining_indexes}"
      if remaining_indexes < mvs_r
        y = 0 - (remaining_indexes + 1)
      end
      #      puts "Next index = #{y + mvs_r}"
      #      puts '--------------------------'
      row_number += mvs_d
    end
    puts "Number of trees = #{@num_of_trees}"
    @trees_per_run << @num_of_trees
  end

end

 aoc2020_d03_2

def move_down_rows

  number_of_rows = 11

  row_number = 1
  moves_down = 2

  while row_number <= number_of_rows

    puts "row number is #{row_number}"
    row_number += moves_down

  end

end

# move_down_rows