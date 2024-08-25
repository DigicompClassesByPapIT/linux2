from sys import argv


def fib_cached(n, cache={}):
    if n < 2:
        return n
    try:
        val = cache[n]
        print('cache hit')
    except KeyError:
        val = fib_cached(n - 2) + fib_cached(n - 1)
        cache[n] = val
    return val


if __name__ == "__main__":
    print(fib_cached(int(argv[1])))
