# This program finds prime numbers and stores them into a file.
#

require_relative "primality_tester"
require_relative "file_manager"
require_relative "version"

# Keeps the programming until otherwise
running = true

# Loads the last prime found and continues finding primes from that number.
#current_test_number = Elif.open($prime_file) {|f| f.gets}.to_i

#if (current_test_number == nil)
  current_prime = 3
#end

fileManager = FileManager.new("prime_numbers.txt")
primeTester = PrimalityTester.new

# Display intro message.
puts "Running prime finder " + version()
puts "Primes found are logged into #{fileManager.prime_filename}"

# Open files for writing.
fileManager.open()

puts "Writing prime '2' to file."
fileManager.write("prime", 2)
fileManager.write("prime", "\n")

puts "Starting at prime: #{current_prime}."

while running  
  # Check if current number is prime
  if (primeTester.testPrime(current_prime))
    # Store the prime number
    fileManager.write("prime", current_prime)
    fileManager.write("prime", "\n")
  end

  # Check if we need to stop the program without blocking it.
#  if (gets.chomp == 'q')
#    running = false
#  else
    # Test next number
    current_prime += 1
#  end
end

# Close files when finished with them.
fileManager.close()

