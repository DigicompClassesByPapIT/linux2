#!/usr/bin/env python3
import os
from random import randint, choice, uniform
from sys import stdout
from uuid import uuid4


def main() -> None:
    """
    Generate fake bank data
    """
    # banks IDs
    bank_ids = tuple(range(1, 116))
    # Customer IDs
    customer_ids = tuple(range(1, 1367))
    # Header of the files
    header = '''"transaction_id","bank_id","customer_id","amount"\n'''
    # Generate the data printing it to the console
    stdout.write(header)
    for _ in range(0, randint(10_000, 11_000)):
        amount = round(uniform(-10_000, 10_000), 2)
        bank_id = choice(bank_ids)
        customer_id = choice(customer_ids)
        # Generate a random transaction ID using UUID
        transaction_id = str(uuid4())
        try:
            stdout.write(f'''"{transaction_id}",{bank_id},{customer_id},{amount}\n''')
            stdout.flush()
        except BrokenPipeError:
            # Python flushes standard streams on exit; redirect to /dev/null
            devnull = os.open(os.devnull, os.O_WRONLY)
            os.dup2(devnull, stdout.fileno())


if __name__ == '__main__':
    main()
