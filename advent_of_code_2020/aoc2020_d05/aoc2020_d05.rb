def aco2020_d05_1_long

  @seat_ids = []

  file = File.open("aoc2020_d05_input.txt", "r")

  file.each do |seat_ref|
    @row_range = (0..127).to_a
    @column_range = (0..7).to_a

    #    puts seat_ref

    @rr0 = seat_ref[0]
    @rr1 = seat_ref[1]
    @rr2 = seat_ref[2]
    @rr3 = seat_ref[3]
    @rr4 = seat_ref[4]
    @rr5 = seat_ref[5]
    @rr6 = seat_ref[6]
    @cr7 = seat_ref[7]
    @cr8 = seat_ref[8]
    @cr9 = seat_ref[9]

    if @rr0 == 'F'
      @row_range.slice!(64..127)
    else
      @row_range.slice!(0..63)
    end

    if @rr1 == 'F'
      @row_range.slice!(32..63)
    else
      @row_range.slice!(0..31)
    end

    if @rr2 == 'F'
      @row_range.slice!(16..31)
    else
      @row_range.slice!(0..15)
    end

    if @rr3 == 'F'
      @row_range.slice!(8..15)
    else
      @row_range.slice!(0..7)
    end

    if @rr4 == 'F'
      @row_range.slice!(4..7)
    else
      @row_range.slice!(0..3)
    end

    if @rr5 == 'F'
      @row_range.slice!(2..3)
    else
      @row_range.slice!(0..1)
    end

    if @rr6 == 'F'
      @row = @row_range[0]
    else
      @row = @row_range[1]
    end

    if @cr7 == 'L'
      @column_range.slice!(4..7)
    else
      @column_range.slice!(0..3)
    end

    if @cr8 == 'L'
      @column_range.slice!(2..3)
    else
      @column_range.slice!(0..1)
    end

    if @cr9 == 'L'
      @column = @column_range[0]
    else
      @column = @column_range[1]
    end


    @seat_id = (@row * 8) + @column
    @seat_ids << @seat_id

    #   puts "Row #{@row}, column #{@column}, seat ID #{@seat_id}"
  end

  #  puts "Highest seat ID is #{@seat_ids.max}"
  # print @seat_ids.sort

  @sorted_ids = @seat_ids.sort

  @sorted_ids.each do |st_rf|
    if st_rf != @sorted_ids.max
      #      puts @sorted_ids.index(st_rf)
      #      puts @sorted_ids.index(st_rf) + 1
      #      puts @sorted_ids[@sorted_ids.index(st_rf)]
      #      puts @sorted_ids[@sorted_ids.index(st_rf) + 1]

      if st_rf + 1 != @sorted_ids[@sorted_ids.index(st_rf) + 1]
        puts st_rf + 1
      end

    end
  end
end

# aco2020_d05_1_long

def aco2020_d05_1_short

  @seat_ids = []

  file = File.open("aoc2020_d05_input.txt", "r")

  file.each do |seat_ref|
    @row_range = (0..127).to_a
    @column_range = (0..7).to_a

    @rr0 = seat_ref[0]
    @rr1 = seat_ref[1]
    @rr2 = seat_ref[2]
    @rr3 = seat_ref[3]
    @rr4 = seat_ref[4]
    @rr5 = seat_ref[5]
    @rr6 = seat_ref[6]
    @cr7 = seat_ref[7]
    @cr8 = seat_ref[8]
    @cr9 = seat_ref[9]

    @rr0 == 'F' ? (@row_range.slice!(64..127)) : (@row_range.slice!(0..63))
    @rr1 == 'F' ? (@row_range.slice!(32..63)) : (@row_range.slice!(0..31))
    @rr2 == 'F' ? (@row_range.slice!(16..31)) : (@row_range.slice!(0..15))
    @rr3 == 'F' ? (@row_range.slice!(8..15)) : (@row_range.slice!(0..7))
    @rr4 == 'F' ? (@row_range.slice!(4..7)) : (@row_range.slice!(0..3))
    @rr5 == 'F' ? (@row_range.slice!(2..3)) : (@row_range.slice!(0..1))
    @rr6 == 'F' ? (@row = @row_range[0]) : (@row = @row_range[1])
    @cr7 == 'L' ? (@column_range.slice!(4..7)) : (@column_range.slice!(0..3))
    @cr8 == 'L' ? (@column_range.slice!(2..3)) : (@column_range.slice!(0..1))
    @cr9 == 'L' ? (@column = @column_range[0]) : (@column = @column_range[1])

    @seat_id = (@row * 8) + @column
    @seat_ids << @seat_id
    #   puts "Row #{@row}, column #{@column}, seat ID #{@seat_id}"
  end
  #  puts "Highest seat ID is #{@seat_ids.max}"
  # print @seat_ids.sort

  @sorted_ids = @seat_ids.sort

  @sorted_ids.each do |st_rf|
    if st_rf != @sorted_ids.max
      if st_rf + 1 != @sorted_ids[@sorted_ids.index(st_rf) + 1]
        puts st_rf + 1
      end
    end
  end

end

# aco2020_d05_1_short
