def main():
    _ = input()
    setA = set(map(int, input().split()))
    num_of_commands = int(input())
    for i in range(num_of_commands):
        command = input().split()
        if command[0] == 'pop':
            setA.pop()
        elif command[0] == 'remove':
            setA.remove(int(command[1]))
        elif command[0] == 'discard':
            setA.discard(int(command[1]))

    print(sum(setA))


if __name__ == "__main__":
    main()
