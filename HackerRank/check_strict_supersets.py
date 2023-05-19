def main():
    setA = set(map(int, input().split()))
    num_of_sets = input()
    list_of_sets = []
    for i in range(int(num_of_sets)):
        list_of_sets.append(set(map(int, input().split())))
    flag = 'True'
    for sets in list_of_sets:
        if len(setA) <= len(sets):
            flag = 'False'
            break
        elif len(setA) > len(sets):
            flag = setA.issuperset(sets)
            if not flag:
                break
    print(flag)


if __name__ == "__main__":
    main()
