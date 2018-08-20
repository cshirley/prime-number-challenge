require 'spec_helper'

describe PrimeNumberGenerator do
  let(:first_10_primes) { [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] }
  let(:generator) { PrimeNumberGenerator.new }
  let(:number_of_primes) { first_10_primes.count }

  describe "Checks and generates individual numbers for primeness" do
    it "Should Validate a prime number" do
      expect(generator.is_prime?(7)).to eq(true)
    end

    it "Should not Validate a non-prime number" do
      expect(generator.is_prime?(9)).to eq(false)
    end

    it "Should Generate the next prime" do
      expect(generator.next_prime(9)).to eq(11)
    end

  end

  describe "Generates an array of the first x prime numbers" do
    before {
      @primes = generator.create_primes(number_of_primes)
    }
    it { expect(@primes.length).to eq(number_of_primes) }
    it { expect(@primes).to eq(first_10_primes) }
  end

  describe "Generate an array of the first x+1 prime numbers" do
    before {
      @primes = generator.create_primes(number_of_primes+1)
    }
    it { expect(@primes.length).to eq(number_of_primes+1) }
  end

  describe "Generates the first 10 primes by brute force" do
    before(:each) {
      @primes = generator.brute_force(10)
    }
    it { expect(@primes.length).to eq(10) }
    it { expect(@primes).to eq(first_10_primes) }
  end

  describe "Generates the first 10 primes by sive" do
    before(:each) {
      @primes = generator.eratosthenes_sive(10)
    }

    it { expect(@primes.length).to eq(10) }
    it { expect(@primes).to eq(first_10_primes) }
  end
end
