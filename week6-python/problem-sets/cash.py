# Calculates the minimum number of coins required to give change - CS50 Pset6
# https://cs50.harvard.edu/x/psets/6/cash/
# Uses quarters, dimes, nickels, and pennies
# Input is in dollars, like 0.75 for 75 cents

from cs50 import get_float

# ask user for a change until they give a non-negative number
while True:
    change = get_float("Change owed: ")
    if change >= 0:
        break

# Convert dollars to cents and round it
cents = round(change * 100)

# Initialize count
coins = 0

# quarters (25¢)
coins += cents // 25
# Get the rest of te division
cents %= 25

# dimes (10¢)
coins += cents // 10
cents %= 10

# nickels (5¢)
coins += cents // 5
cents %= 5

# pennies (1¢)
coins += cents // 1

# Output total number of coins
print(coins)
