# Logical operators, using lists

# Prompt user to agree and transform to lowercase
# https://youtu.be/0eNc5lJfZFM?t=3122
s = input("Do you agree? ").lower()

# Check whether agreed
if s in ["y", "yes"]:
    print("Agreed.")
elif s in ["n", "no"]:
    print("Not agreed.")
