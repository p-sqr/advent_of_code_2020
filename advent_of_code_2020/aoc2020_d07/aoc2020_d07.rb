def aoc_2020_d07_1

  file = File.open("aoc2020_d07_input_sorted.txt")

  @bag_hash = {}
  @no_bags = {}
  @one_or_more_bags = {}
  @multiple_bags = {}
  @one_bag = {}
  @two_bags = {}
  @three_bags = {}
  @four_bags = {}
  @can_carry_shiny_gold = []

  file.each do |row|

    row_array = row.gsub("\n", '').split('contain')
    ra0 = row_array[0]
    ra0nobags = ra0.gsub!('bags', '').strip!
    @bag_hash[ra0nobags] = row_array[1]

  end

  #   display_hash(@bag_hash)

  @bag_hash.each do |k, v|

    if v.include?('no other bags')
      #     puts "No other bags for #{k}: #{v}"
      @no_bags[k] = v
    else
      @one_or_more_bags[k] = v
    end

  end

  #  display_hash(@one_or_more_bags)
  #  raise "look at all the bags"

  @one_or_more_bags.each do |k, v|
    v.gsub!(/\d+/, '')
    v.gsub!('.', '')
    v.gsub!('bags', '')
    v.gsub!('bag', '')
    v.strip!
  end

  #  display_hash(@one_or_more_bags)
  ##  raise "Should be no numbers or full stops or leading spaces or 'bags' or 'bag' or trailing spaces"

  @one_or_more_bags.each do |k, v|
    if v[',']
      @multiple_bags[k] = v
    else
      @one_bag[k] = v
    end
  end

  #  display_hash(@one_bag)
  #  raise "check out the one baggers"

  #  display_hash(@multiple_bags)
  #  raise "Check out all them multiple bagses"

  @multiple_bags.each do |k, v|
    v_split_array = v.split(',')

    case v_split_array.size

    when 2
      @two_bags[k] = v_split_array
    when 3
      @three_bags[k] = v_split_array
    when 4
      @four_bags[k] = v_split_array
    end

  end

  @two_bags.each do |k, v|
    v[0].strip!
    v[1].strip!
  end

  @three_bags.each do |k, v|
    v[0].strip!
    v[1].strip!
    v[2].strip!
  end

  @four_bags.each do |k, v|
    v[0].strip!
    v[1].strip!
    v[2].strip!
    v[3].strip!
  end

  # puts @multiple_bags.size
  # puts @two_bags.size
  # puts @three_bags.size
  # puts @four_bags.size
  # display_hash(@two_bags)
  # display_hash(@three_bags)
  # display_hash(@four_bags)

  @bag_hashes = [@one_bag, @two_bags, @three_bags, @four_bags]

  @bag_hashes.each do |mltibg_hash|
    mltibg_hash.each do |k, v|
      @can_carry_shiny_gold << k if v.include?('shiny gold')
    end
  end

  no_more_bags_added = false

  while no_more_bags_added == false

    start_size = @can_carry_shiny_gold.uniq.size
    # puts "Start size: #{start_size}"
    # puts "Here is your starter for 7: #{@can_carry_shiny_gold}"

    @can_carry_shiny_gold.each do |clrd_bag|

      #     puts "checking the arrays for #{clrd_bag}"

      @one_bag.each do |k, v|
        if v[clrd_bag] && @can_carry_shiny_gold.include?(k) == false
          @can_carry_shiny_gold << k
        end
      end

      @two_bags.each do |k, v|
        @can_carry_shiny_gold << k if v[0][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
        #        puts "#{k} - #{v}" if v[0][clrd_bag]
        @can_carry_shiny_gold << k if v[1][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
        #      puts "#{k} - #{v}" if v[1][clrd_bag]
      end
      #     puts "After checking @two_bags, @can_carry_shiny_gold now contains #{@can_carry_shiny_gold.size} bags"
      #   puts '--------------------------------------------------------------------------------------------------'
      @three_bags.each do |k, v|
        @can_carry_shiny_gold << k if v[0][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
        @can_carry_shiny_gold << k if v[1][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
        @can_carry_shiny_gold << k if v[2][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
      end

      @four_bags.each do |k, v|
        @can_carry_shiny_gold << k if v[0][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
        @can_carry_shiny_gold << k if v[1][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
        @can_carry_shiny_gold << k if v[2][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
        @can_carry_shiny_gold << k if v[3][clrd_bag] && @can_carry_shiny_gold.include?(k) == false
      end

    end

    #   puts "more bags added, count is now #{@can_carry_shiny_gold.uniq.size}" if @can_carry_shiny_gold.uniq.size > start_size
    #  puts "no more bags added" if @can_carry_shiny_gold.uniq.size == start_size
    no_more_bags_added = true if @can_carry_shiny_gold.uniq.size == start_size

  end

  #  puts @can_carry_shiny_gold.uniq.size
  #  print @can_carry_shiny_gold.uniq.sort


end


def display_hash(hash_name)
  hash_name.each do |hash_pair|
    print hash_pair
    puts
  end
end

# aoc_2020_d07_1

def aoc2020_d07_2

  @bag_hash_with_numbers = {}
  @bags_to_check = ['shiny gold']
  @all_bags = []

  file = File.open("aoc2020_d07_input_sorted.txt")
  file.each do |row|

    row_array = row.gsub("\n", '').split('contain')
    ra0 = row_array[0]
    ra0nobags = ra0.gsub!('bags', '').strip!
    @bag_hash_with_numbers[ra0nobags] = row_array[1]

  end


  @bag_hash_with_numbers.each {|k, v| @bag_hash_with_numbers.delete(k) if v.include?('no other')}

  @bag_with_inner_bags_hashes = {}
  @bag_hash_with_numbers.each do |k, v|
    v.gsub!('.', '')
    v.gsub!('bags', '')
    v.gsub!('bag', '')
    v.strip!

    v_split_array_hash = {}

    v_split_array = v.split(',')
    v_split_array.each do |val|
      val.strip!
      num = val[0]
      v_split_array_hash[val[2..-1]] = num.to_i
    end

    @bag_with_inner_bags_hashes[k] = v_split_array_hash

  end

  #   display_hash(@bag_with_inner_bags_hashes)

  number_of_bags = 0
    no_more_bags_added = false

  while no_more_bags_added == false

    @bags_to_check.each do |a_bag|

      if @bag_with_inner_bags_hashes.has_key?(a_bag)

        bag_array = @bag_with_inner_bags_hashes[a_bag]

        bag_array.each do |k, v|
          next if v == 0

          v.times do
            @bags_to_check << k
            number_of_bags += 1
          end
          # puts "#{v} #{k} bag(s) added to @bags_to_check"
          # puts '-----------------'
        end
      end

      @bags_to_check.delete_at(@bags_to_check.index(a_bag))

    end

    no_more_bags_added = true if @bags_to_check.size == 0
    #    no_more_bags_added = true

  end

  # print @bags_to_check
  # puts @bags_to_check.size
  puts "Number of bags: #{number_of_bags}"
end

aoc2020_d07_2

