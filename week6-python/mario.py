# Prints a block of n bricks with a loop

# removed from top level namespace: import get_int
import cs50

while True:
    # added cs50 scope
    # https://youtu.be/0eNc5lJfZFM?t=5746
    n = cs50.get_int("Height and Lenght: ")
    if n > 0:
        # break out of this loop
        break

for i in range(n):
    print("#" * n)
