from sys import argv


def fib(n):
    if n < 2:
        return n
    return fib(n - 2) + fib(n - 1)


if __name__ == "__main__":
    print(fib(int(argv[1])))
