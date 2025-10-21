# Take a sequence of DNA and determine which person it most likely belongs to - CS50 Pset6
# https://cs50.harvard.edu/x/psets/6/cash/

import csv
import sys


def main():

    # TODO: Check for command-line usage ✓
    # is there is not exactly 3 arguments:
    if len(sys.argv) != 3:
       # we explain how to use, and exit with error
        print("Usage: python dna.py data.csv sequence.txt")
        sys.exit(1)

    # TODO: Read database file into a variable ✓
    with open(sys.argv[1], "r") as database_file:
        # reads CSV where first row = column headers, each subsequent row becomes a dictionary
        # https://youtu.be/j84b_EgntcQ?t=267
        reader = csv.DictReader(database_file)
        database = [row for row in reader]

    # TODO: Read DNA sequence file into a variable ✓
    # https://youtu.be/j84b_EgntcQ?t=301
    with open(sys.argv[2], "r") as sequence_file:
        sequence = sequence_file.read()

    # TODO: Find longest match of each STR in DNA sequence ✓
    # https://youtu.be/j84b_EgntcQ?t=313
    # empty dictionary to keep our count
    str_counter = {}
    for key in database[0].keys():
        # if key is name we skip it
        if key == "name":
            continue
        str_counter[key] = longest_match(sequence, key)

    # TODO: Check database for matching profiles ✓
    # https://youtu.be/j84b_EgntcQ?t=439
    for row in database:
        match = True
        for key in row.keys():
            if key == "name":
                continue
            if int(row[key]) != str_counter[key]:
                match = False
                break
        if match:
            print(row["name"])
            return

    print("No match")

    # The following came already coded:


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
