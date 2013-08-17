# Takes care of all the reading and writing to files.

# Reads files backwards starting from bottom.
require "elif"    

class FileManager

  attr_accessor :prime_filename
  attr_accessor :prime_file
  
  def initialize(prime_file)
    @prime_filename = prime_file
  end
  
  # Opens the files to be written to.
  def open
    @prime_file = File.open(@prime_filename, "a")
  end
  
  # Write value to the correct file
  def write(file, value)
    case file
    when "prime"
      @prime_file.write(value)
    else
      puts "That type of file does not exist."
    end  
  end
  
  # Closes the opened files.
  def close
    @prime_file.close
  end
  
  # Loads last number found from file 
  def loadLastNumber(file)
    case file
    when "prime"
      prime = Elif.open(@prime_filename) {|f| f.gets}.to_i
      
      # Check if there is a number
      if (prime == 0)
        puts "Writing prime '2' to file."
        self.write("prime", 2)
        self.write("prime", "\n")
        return 3
      else
        return prime
      end
      
    else
      puts "That file does not exist."
    end
  end
 
end

