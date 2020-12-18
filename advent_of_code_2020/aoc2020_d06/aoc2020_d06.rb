def aoc2020_d06_1
  @group_answers_total = 0

  file = File.open("aoc2020_d06_input.txt", "r")

  file_string = file.read
  ## Split the file into an array at every blank line
  file_split = file_string.split(/\n{2,}/)

  puts "there are #{file_split.size} groups"

  file_split.each do |a_group|

    #    puts a_group
    @file_split_string = ''

    a_group.gsub("\n", '').each_char do |ech_chr|

      @file_split_string << ech_chr

      # print @file_split_string.chars.to_a.uniq.size
      # print ' '
      # print @file_split_string.chars.to_a.uniq.sort
      # puts
      # puts '------------------------------'

    end
    @group_answers_total += @file_split_string.chars.to_a.uniq.size
  end
  print @group_answers_total
end

# aoc2020_d06_1

def aoc2020_d06_2
  @group_all_answered_yes = 0

  file = File.open("aoc2020_d06_input.txt", "r")

  file_string = file.read
  ## Split the file into an array at every blank line
  file_split = file_string.split(/\n{2,}/)

  # puts "There are #{file_split.size} groups"
  # puts

  file_split.each do |a_group|
    #    puts a_group

    @file_split_string = ''
    @file_split_array = []
    # Number of lines per group
    @group_lines = a_group.lines.count

    # @group_lines == 1 ? (line_lines = 'line') : (line_lines = 'lines')
    # puts "This group has #{@group_lines} #{line_lines}"

    # Get rid of newline characters and add each character to an array
    a_group.gsub("\n", '').each_char do |ech_chr|
      @file_split_array << ech_chr
    end

    #    print @file_split_array.sort
    #    puts

    # Iterate over the array and make a hash that has each element as the key and the number of instances of that element as the value.
    @file_split_count_hash = Hash[@file_split_array.group_by { |x| x }.map { |k, v| [k, v.length] }]
    # print @file_split_count_hash
    # puts

    @file_split_count_hash.each do |k, v|
      # Add 1 to @group_all_answered_yes if the number of instances is the same as the number of lines in the group.
      @group_all_answered_yes += 1 if v == @group_lines
    end

  end

  puts @group_all_answered_yes

end

# aoc2020_d06_2
