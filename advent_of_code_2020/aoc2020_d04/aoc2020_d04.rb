def aoc2020_d04_1

  @valid_passports = 0

  file = File.open("aoc2020_d04_example.txt", "r")
  #  file = File.open("aoc2020_d04_input.txt", "r")

  file_string = file.read
  ## Split the file into an array at every blank line
  file_split = file_string.split(/\n{2,}/)

  file_split.each do |array_of_hashes|

    @cred_hash = {}

    array_split = array_of_hashes.split(' ')

    array_split.each do |kv_pair|

      kv_pair_split = kv_pair.split(':')
      split_pair_k = kv_pair_split[0]
      split_pair_v = kv_pair_split[1]

      @cred_hash[split_pair_k] = split_pair_v

    end

    @valid_passports += 1 if @cred_hash.size == 8
    @valid_passports += 1 if @cred_hash.size == 7 && @cred_hash.include?('cid') == false

    #    puts @cred_hash

  end

  puts "There are #{@valid_passports} valid passports"
end

# aoc2020_d04_1

def aoc2020_d04_2

  @valid_passports = 0
  @invalid_passports = 0
  @keys_array = []
  @ecl_array = []
  @valid_passports_array = []
  @check_byr = []
  @check_ecl = []
  @check_eyr = []
  @check_hcl = []
  @check_hgt_in = []
  @check_hgt_cm = []
  @check_iyr = []
  @check_pid = []

  file = File.open("aoc2020_d04_2_input.txt", "r")

  file_string = file.read
  ## Split the file into an array at every blank line
  file_split = file_string.split(/\n{2,}/)

  # puts "there are #{file_split.size} passports"
  # puts '########################'
  # puts

  file_split.each do |array_of_hashes|
    @valid_number_of_passport_creds = false
    @cred_hash = {}

    array_split = array_of_hashes.split(' ')

    array_split.each do |kv_pair|
      @cred_validation = {}
      kv_pair_split = kv_pair.split(':')
      split_pair_k = kv_pair_split[0]
      split_pair_v = kv_pair_split[1]

      @cred_hash[split_pair_k] = split_pair_v
      @keys_array << split_pair_k
    end

    # Only process if 8 credentials or 7 without 'cid'

    @valid_number_of_passport_creds = true if @cred_hash.size == 8
    @valid_number_of_passport_creds = true if @cred_hash.size == 7 && @cred_hash.include?('cid') == false

    # Check the values for each credential
    if @valid_number_of_passport_creds
      check_byr
      check_iyr
      check_eyr
      check_hgt
      check_hcl
      check_ecl
      check_pid
      #     check_cid
    end

    # print @cred_hash.sort_by { |key, val| key }
    # puts
    # puts "Not enough credentials" if @cred_hash.size < 7
    # puts "cid not present" if @cred_hash.size == 7 && @cred_hash.include?('cid') == false
    # puts "cid present, some other credential missing" if @cred_hash.size == 7 && @cred_hash.include?('cid') == true
    # print @cred_validation.sort_by { |key, val| key }
    # puts

    #Check creds_validation for 'invalid' or being an empty hash

    if @cred_validation.has_value?('invalid') || @cred_validation == {}
      #      puts "invalid"
      @invalid_passports += 1
    else
      #      puts 'valid'
      @valid_passports += 1
      @valid_passports_array << @cred_hash
    end
    # puts '-------------------------------------------------------------------------------------------------------------'
    # puts
  end
  puts "There are #{@valid_passports} valid passports and #{@invalid_passports} invalid"
  # puts "keys array"
  # print @keys_array.uniq.sort
  # puts "ecl array"
  # print @ecl_array.uniq.sort
  # puts 'Valid passports'
  # puts
  # print @check_byr.uniq.sort
  # puts
  # print @check_ecl.uniq.sort
  # puts
  # print @check_eyr.uniq.sort
  # puts
  # print @check_hcl.uniq.sort
  # puts
  # print @check_hgt_in.uniq.sort
  # puts
  # print @check_hgt_cm.uniq.sort
  # puts
  # print @check_iyr.uniq.sort
  # puts
  # print @check_pid.uniq.sort
end

def check_byr
  # byr (Birth Year) - four digits; at least 1920 and at most 2002.

  if @cred_hash['byr']
    byr = @cred_hash['byr'].to_i
    if byr >= 1920 && byr <= 2002
      @cred_validation['byr'] = 'valid'
      @check_byr << byr
    else
      @cred_validation['byr'] = 'invalid'
    end
  else
    @cred_validation['byr'] = 'not present'
  end
end

def check_iyr
  #    iyr (Issue Year) - four digits; at least 2010 and at most 2020.
  if @cred_hash['iyr']
    iyr = @cred_hash['iyr'].to_i
    if iyr >= 2010 && iyr <= 2020
      @cred_validation['iyr'] = 'valid'
      @check_iyr << iyr
    else
      @cred_validation['iyr'] = 'invalid'
    end
  end
end

def check_eyr
  #    eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
  if @cred_hash['eyr']
    eyr = @cred_hash['eyr'].to_i
    if eyr >= 2020 && eyr <= 2030
      @cred_validation['eyr'] = 'valid'
      @check_eyr << eyr
    else
      @cred_validation['eyr'] = 'invalid'
    end
  else
    @cred_validation['eyr'] = 'not present'
  end
end

def check_hgt
  #    hgt (Height) - a number followed by either cm or in:
  #          If cm, the number must be at least 150 and at most 193.
  #          If in, the number must be at least 59 and at most 76.

  if @cred_hash['hgt']
    height = @cred_hash['hgt']
    if height.end_with?('in')
      height_num = height.gsub('in', '').to_i
      if height_num >= 59 && height_num <= 76
        @cred_validation['hgt'] = 'valid'
        @check_hgt_in << height_num
      else
        @cred_validation['hgt'] = 'invalid'
      end
    else
      height_num = height.gsub('cm', '').to_i
      if height_num >= 150 && height_num <= 193
        @cred_validation['hgt'] = 'valid'
        @check_hgt_cm << height_num
      else
        @cred_validation['hgt'] = 'invalid'
      end
    end
  else
    @cred_validation['hgt'] = 'not present'

  end
end

def check_hcl
  #    hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  if @cred_hash['hcl']
    if @cred_hash['hcl'] =~ /#[a-f0-9]{6}/
      @cred_validation['hcl'] = 'valid'
      @check_hcl << @cred_hash['hcl']
    else
      @cred_validation['hcl'] = 'invalid'
    end
  else
    @cred_validation['hcl'] = 'not present'
  end
end

def check_ecl
  #    ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  eye_cols = %w[amb blu brn gry grn hzl oth]
  if @cred_hash['ecl']
    @ecl_array << @cred_hash['ecl']

    if eye_cols.include?(@cred_hash['ecl'])
      @cred_validation['ecl'] = 'valid'
      @check_ecl << @cred_hash['ecl']
    else
      @cred_validation['ecl'] = 'invalid'
    end
  else
    @cred_validation['ecl'] = 'not present'
  end
end

def check_pid
  #    pid (Passport ID) - a nine-digit number, including leading zeroes.

  if @cred_hash['pid']
    pid = @cred_hash['pid']
    if pid =~ /^\d+$/ && pid.length == 9
      @cred_validation['pid'] = 'valid'
      @check_pid << pid
    else
      @cred_validation['pid'] = 'invalid'
    end
  else
    @cred_validation['pid'] = 'not present'
  end
end

def check_cid
  # If it's present, mark it as valid regardless of what value it has
  if @cred_hash['cid']
    @cred_validation['cid'] = 'valid'
  end

end

aoc2020_d04_2

