# https://youtu.be/0eNc5lJfZFM?t=4176

# Demonstrates how to call main() the right way: __name__

def main():
    meow(3)


# Meow some number of times
def meow(n):
    for i in range(n):
        print("meow")


if __name__ == "__main__":
    main()
