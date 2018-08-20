class PrimeNumberGenerator

  DEFAULTS = {start_number:0}
  attr_accessor :start_number
  attr_accessor :primes
  attr_accessor :non_primes
  attr_accessor :prime_count

  def initialize(options = {} )
    options = DEFAULTS.merge(options)
    @start_number = options[:start_number]
    @primes = {}
    @non_primes = {}
    @last_prime = 2
    @prime_count = 0
  end

  def create_primes(count=10)
    eratosthenes_sive(count)
  end

  def eratosthenes_sive(count=10)
    while prime_count < count
      eratosthenes_sive_algorithm(count)
    end
    primes.values.sort[0..count-1]
  end

  def eratosthenes_sive_algorithm(count)
    count = @last_prime + count
    2.upto(count) do |factor_candidate|
      next if non_primes.has_key?(factor_candidate.to_s)

      factor_candidate_power_step = factor_candidate * 2

      while factor_candidate_power_step <= count do
        non_primes[factor_candidate_power_step.to_s] = factor_candidate_power_step
        factor_candidate_power_step += factor_candidate
      end

      unless non_primes.has_key?(factor_candidate.to_s)
        unless primes.has_key?(factor_candidate.to_s)
          primes[factor_candidate.to_s] = factor_candidate
          @last_prime = factor_candidate
          @prime_count += 1
        end
      end
    end
    @prime_count
  end

  def brute_force(count=10)

    primes      = []
    last_prime  = self.start_number

    until primes.length == count
      last_prime = next_prime(last_prime)
      primes << last_prime
    end

    primes
  end

  def is_prime?(prime_candidate)
    return false if prime_candidate <= 1
    2.upto(Math.sqrt(prime_candidate).to_i) do |factor_candidate|
      return false if prime_candidate % factor_candidate == 0
    end
    true
  end

  def next_prime(number)
    value = number + 1
    until is_prime?(value)
      value += 1
    end

    value
  end
end
