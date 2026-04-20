# Simple program to check if a number is even or odd

def check_even_odd(number):
    if number % 2 == 0:
        return "even"
    else:
        return "odd"

# Get user input
try:
    num = int(input("Enter a number: "))
    result = check_even_odd(num)
    print(f"The number {num} is {result}.")
except ValueError:
    print("Please enter a valid integer.")