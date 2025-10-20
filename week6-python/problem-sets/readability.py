# Outputs the grade level for the text according to the Coleman-Liau formula - CS50 Pset6
# https://cs50.harvard.edu/x/psets/6/readability/

from cs50 import get_string

# prompt the user for text
text = get_string("Text: ")

# Count the number of letters (only a-z and A-Z)
letters = 0
for char in text:
    # checks if each char is a letter (ignores numbers, spaces, punctuation)
    if char.isalpha():
        letters += 1

# Split the text into a list of words
words_list = text.split()
# Count the number of words in the list
words_total = len(words_list)
# Save to the words variable to use in cl_index
words = words_total

# Count the sentences: look for ., !, or ?
sentences = 0
for char in text:
    if char in ".!?":
        sentences += 1

# If there are no words, avoid division by zero, but assuming input has words
if words == 0:
    print("Before Grade 1")
else:
    # Calculate average letters per 100 words
    L = (letters / words) * 100
    # Average sentences per 100 words
    S = (sentences / words) * 100
    # Coleman-Liau formula (https://cs50.harvard.edu/x/psets/6/readability/#specification):
    cl_index = round(0.0588 * L - 0.296 * S - 15.8)

    # Output the grade level
    if cl_index < 1:
        print("Before Grade 1")
    elif cl_index >= 16:
        print("Grade 16+")
    else:
        print(f"Grade {cl_index}")
