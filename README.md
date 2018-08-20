prime_number_multiplication_challenge
=====================================
## Challenge
-------------------------------------------
Write a program that calculates and prints out a multiplication table of the first 10 calculated prime numbers.

Detail: The program must run from the command line and print to screen 1 table.
Across the top and down the left side should be the 10 primes, and the body of the table should contain the product of multiplying these numbers.

Please include tests.

Think about cases where the code doesn't know the upper limit (maybe it's 30 and not 10 primes?)
Think about code complexity.
Don't use the Ruby prime method.

Impress me :-)
--------------------------------------------


## Solution

This is an interesting problem as there are number of algorithms which have trade offs generally between memory, computational complexity and concurrency (later depends on VM).  As this is implemented on MRI the scope for concurrency for processing the search space is limited due to GIL.

Current implementation uses the simple Eratosthenes sive, the class caches the results allowing a batch processing of the address space due to limitation of the sive only being able to work over a known number range.

I have included a brute_force implementation which has been used to verify the results of the sive implementation.

### Development process
 * Functionality working (including test cases)
 * Optimisation of is_prime? test to check possible factors up to square root of candidate number
 * Implementation of Eratosthenes sive

### Future Enhancements
 * Concurrency (investigate JRuby/Rubinious/process forking)
 * Algorithim

### References
 * http://en.wikipedia.org/wiki/Prime_number_theorem
 * http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
 * http://en.wikipedia.org/wiki/Sieve_theory

### Usage

from the command line run:
 ./bin/prime_generator


