# https://youtu.be/0eNc5lJfZFM?t=6976
# Prints a command-line argument

from sys import argv

if len(argv) == 2:
    print(f"hello, {argv[1]}")
else:
    print("hello, world")
