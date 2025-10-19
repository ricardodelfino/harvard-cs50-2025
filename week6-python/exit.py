# https://youtu.be/0eNc5lJfZFM?t=7106
# Exits with explicit value, importing sys
# Learn to use echo $? to see exit status
# exit and argv from inside sys library

import sys

# argv is not equal 2 arguments
if len(sys.argv) != 2:
    print("Missing command-line argument")
    sys.exit(1)

print(f"hello, {sys.argv[1]}")
sys.exit(0)
