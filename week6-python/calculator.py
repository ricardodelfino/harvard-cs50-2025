# https://youtu.be/0eNc5lJfZFM?t=4916
# Floating-point imprecision

# Prompt user for x
x = int(input("x: "))

# Prompt user for y
y = int(input("y: "))

# Divide x by y
z = x / y

# value of z with 50 decimal places
# Floating is still a issue in Python
print(f"{z:.50f}")
