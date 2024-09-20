def first_function():
    total = 0
    for x in range(1, 50):
        y = second_function(x)
        total = total + y

    return total


def second_function(a):
    result = 3 * a**2 + 5 * a
    return result


total = first_function()
print(f'Total = {total}')
