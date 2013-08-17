# This program finds prime numbers and stores them into a file.
#

require_relative "primality_tester"
require_relative "file_manager"
require_relative "version"

# Display intro message.
puts "Running prime finder " + version()

# Keeps the programming until otherwise
running = true

fileManager = FileManager.new("prime_numbers.txt")
primeTester = PrimalityTester.new

# Open files for writing.
fileManager.open()

# Loads the last prime found and continues finding primes
current_prime = fileManager.loadLastNumber("prime")

puts "Starting at number: #{current_prime}."

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
    # Test next number (+2 because even numbers cannot be prime by definition)
    # If last digit is a 5 then skip (multiple of 5)
    if (current_prime.to_s.slice(-1) == 5)
      current_prime += 4
    else
      current_prime += 2
    end
  
#  end
end

# Close files when finished with them.
fileManager.close()

