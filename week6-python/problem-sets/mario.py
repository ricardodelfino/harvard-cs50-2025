# Prints a half-pyramid’s of n bricks with a loop - CS50 Pset6
# https://cs50.harvard.edu/x/psets/6/mario/less/

# Recreates the Mario half-pyramid from Problem Set 1, but in Python.
# Prompts user for height between 1 and 8, then prints the pyramid.

from cs50 import get_int

# Asks for height until it's valid (1 to 8)
while True:
    height = get_int("Height: ")
    if height >= 1 and height <= 8:
        break  # Got a valid height, exit loop

# Now we build the pyramid row by row
for i in range(1, height + 1):
    # Print spaces for alignment, then the hashes for this row
    print(" " * (height - i) + "#" * i)
