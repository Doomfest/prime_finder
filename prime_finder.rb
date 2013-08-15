# This program finds prime numbers and stores them into a file.
#
#

# Reads files backwards starting from bottom.
require_relative "primality_tester"
require_relative "version"
require_relative "intro_message"
require "elif"

# Keeps the programming until otherwise
running = true

# The file which stores the prime numbers
$prime_file = "prime_numbers.txt"

# Loads the last prime found and continues finding primes from that number.
#current_test_number = Elif.open($prime_file) {|f| f.gets}.to_i

#if (current_test_number == nil)
  current_prime = 3
#end

primeTester = PrimalityTester.new

# Display intro message.
intro_message()

puts "Starting at prime: #{current_prime}."

# Open files for writing.
prime_results_file = File.open($prime_file, "w")
prime_results_file.write(2)
prime_results_file.write("\n")

while running  
  # Check if current number is prime
  if (primeTester.testPrime(current_prime))
    # Store the prime number
    prime_results_file.write(current_prime)
    prime_results_file.write("\n")
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
prime_results_file.close

