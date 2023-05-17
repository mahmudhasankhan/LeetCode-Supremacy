if __name__ == "__main__":
    l, grades = [], []
    for _ in range(int(input())):
        name = input()
        score = float(input())
        l.append([name, score])
        grades.append(score)
    grades = list(set(sorted(grades)))
    second_lowest_grade = grades[1]
    j = 0
    nl = []
    for i in l:
        if second_lowest_grade == i[1]:
            nl.append(i[0])
    nl.sort()
    for i in nl:
        print(i)
