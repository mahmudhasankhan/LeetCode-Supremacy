def main():
    iterations = int(input())
    stamps = set()
    for _ in range(iterations):
        stamps.add(input())
    print(len(stamps))


if __name__ == "__main__":
    main()
