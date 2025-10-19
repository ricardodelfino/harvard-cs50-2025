# https://youtu.be/0eNc5lJfZFM?t=5969
# Averages three numbers using a list and a loop with + operator

from cs50 import get_int

# Get scores
scores = []
for i in range(3):
    score = get_int("Score: ")
    # Or this: scores.append(score)
    # Or this: scores = [score] + [score]
    scores += [score]

# Print average
average = sum(scores) / len(scores)
print(f"Average: {average}")

