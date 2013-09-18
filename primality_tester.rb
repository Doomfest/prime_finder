
class PrimalityTester
  
  attr_accessor :divisor
  
  def initialize
  end  
    
  # Test if the current number is prime. 
  def testPrime(prime)
    @divisor = Math.sqrt(prime).round
    
    while (@divisor -= 1) > 1 
    
      if ((prime % @divisor) == 0)
        return false    # This is not a prime number.
      end

    end
     
    # Found prime number
    puts "Found prime number: #{prime}."
    return true
  end
end

