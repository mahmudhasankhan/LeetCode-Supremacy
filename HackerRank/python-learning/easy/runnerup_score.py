if __name__ == "__main__":
    n = int(input())
    arr = map(int, input().split())
    arr = list(set(sorted(arr)))
    runnerup = arr[len(arr) - 2]
    print(runnerup)
