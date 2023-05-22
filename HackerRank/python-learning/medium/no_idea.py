if __name__ == "__main__":
    array_size, set_size = input().split(" ")
    array_size, set_size = int(array_size), int(set_size)
    array = list(map(int, input().split()))
    setA = set(map(int, input().split()))
    setB = set(map(int, input().split()))
    happinnes = 0
    for val in array:
        if val in setA:
            happinnes += 1
        if val in setB:
            happinnes -= 1
    print(happinnes)
