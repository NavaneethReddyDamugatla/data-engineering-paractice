def is_prime(n):
    """Check if a number is prime."""
    if n <= 1:
        return False
    if n <= 3:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True

def generate_primes(limit):
    """Generate all prime numbers up to the given limit using Sieve of Eratosthenes."""
    if limit < 2:
        return []
    sieve = [True] * (limit + 1)
    sieve[0] = sieve[1] = False
    for i in range(2, int(limit**0.5) + 1):
        if sieve[i]:
            for j in range(i*i, limit + 1, i):
                sieve[j] = False
    return [i for i in range(2, limit + 1) if sieve[i]]

def get_nth_prime(n):
    """Find the nth prime number."""
    if n < 1:
        return None
    count = 0
    num = 2
    while True:
        if is_prime(num):
            count += 1
            if count == n:
                return num
        num += 1

# Example usage
if __name__ == "__main__":
    # Generate primes up to 100
    primes_up_to_100 = generate_primes(100)
    print("Prime numbers up to 100:")
    print(primes_up_to_100)

    # Find the 10th prime
    tenth_prime = get_nth_prime(10)
    print(f"\nThe 10th prime number is: {tenth_prime}")

    # Check if a number is prime
    test_number = 29
    print(f"\nIs {test_number} prime? {is_prime(test_number)}")
