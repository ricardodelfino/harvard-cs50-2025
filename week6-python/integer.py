# https://youtu.be/0eNc5lJfZFM?t=5043
# Handles exception/ errors cases

# Prompt user for an integer
try:
    # convert input to an int
    n = int(input("Input: "))
# Pythonic way:
except ValueError:
    print("Not integer.")
else:
    print("Integer.")
