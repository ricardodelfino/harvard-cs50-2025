# https://youtu.be/0eNc5lJfZFM?t=6268 and https://youtu.be/0eNc5lJfZFM?t=7269
# Implements a phone book using a dictionary (Python´s hash table)

import csv

# Get name and number
name = input("Name: ")
number = input("Number: ")

# Open CSV file in append mode
with open("phonebook.csv", "a") as file:

    # Print to file
    # Create a dictionary
    writer = csv.DictWriter(file, fieldnames=["name", "number"])
    writer.writerow({"name": name, "number": number})
