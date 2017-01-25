# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.
class BeerSong

  def initialize(initial_beer)
    case
    when initial_beer < 0 then @initial_beer = 0
    when initial_beer > 99 then @initial_beer = 99
    else @initial_beer = initial_beer
    end
  end

  def print_song
    # To test the english_num method
    #while @initial_beer >= 0
    #  p english_num(@initial_beer)
    #  @initial_beer -= 1
    #end
    while @initial_beer.to_i >0
      #start = @initial_beer
    	string1 = english_num @initial_beer.to_i
    	if @initial_beer == 1
    		s = ''
      else
        s = 's'
    	end
    	puts "%s bottle#{s} of beer on the wall,\n%s bottle#{s} of beer," %[string1, string1]
    		@initial_beer = @initial_beer.to_i - 1
        if @initial_beer == 1
      		s = ''
        else
          s = 's'
      	end
    	string2 = english_num @initial_beer.to_i
    	#if @initial_beer.to_i == 0
    	#	string2 = 'Zero' # replace 0 with no more
    	#end
    	if @initial_beer.to_i < 0 # if beer becomes negative (-1)
        exit
    		#puts "Go to the store and buy some more, #{english_num(start)} bottles of beer on the wall."
    		#puts ''
    	else
    		puts "Take one down, pass it around,\n%s bottle#{s} of beer on the wall." %[string2]
    		#puts ''
    	end
    end
  end

  def english_num(num)
    numstring = '' #this is returned
  	left = num
   	onesPlace =['One','Two','Three','Four','Five','Six','Seven','Eight','Nine']
   	teen = ['Eleven','Twelve','Thirteen','Fourteen','Fifteen','Sixteen','Seventeen','Eighteen','Nineteen']
   	tensPlace = ['Ten','Twenty','Thirty','Forty','Fifty','Sixty','Seventy','Eighty','Ninety']
    #extract the 10th digit
   	write = left/10
   	left = left - (write*10)
   	if write > 0
   		if (write == 1 and left >0)
   			numstring = numstring + teen[left-1]
   			left = 0
   		else
   			numstring = numstring + tensPlace[write-1]
   		end
   	end

   	#extract the unit digit
   	write = left
   	left = 0
   	if (write >0)
   		numstring = numstring + (numstring.empty? ? onesPlace[write-1] : '-'+onesPlace[write-1].downcase)
    elsif write == 0 && numstring.empty?
      numstring = numstring + 'Zero'
   	end
   	numstring
  end
end

song = BeerSong.new(99).print_song
