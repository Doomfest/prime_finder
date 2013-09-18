# Finds mersenne prime numbers.

# Test primality of mersenne number by Lucas-Lehmer Test
def testMersennePrime(prime)
  s = 4
  mersenne = (2 ** prime) - 1
  
  (prime - 2).times do
    s = ((s * s) - 2) % mersenne
  end
  
  if (s == 0)
    puts "Found mersenne prime number: #{mersenne}"
    return mersenne
  else
    return false
  end
  
end



running = true

p = File.open("prime_numbers.txt", "r")
m = File.open("mersenne_numbers.txt", "w")


while running
  prime_number = p.gets.to_i

  mersenne_prime = testMersennePrime(prime_number)
  
  if (mersenne_prime != false)
    m.write(mersenne_prime)
    m.write("\n")
  end
    
end

m.close
p.close

