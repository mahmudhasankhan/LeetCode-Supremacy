if __name__ == "__main__":
    d = {}
    query = ""
    for _ in range(int(input())):
        name, *scores = input().split()
        scores_list = list(map(float, scores))
        d[name] = scores_list
    query = input()
    avg_score = sum(d[query]) / 3
    print("%.2f" % avg_score)

"""HackerRank Starter Template
"""
# if __name__ == '__main__':
#     n = int(input())
#     student_marks = {}
#     for _ in range(n):
#         name, *line = input().split()
#         scores = list(map(float, line))
#         student_marks[name] = scores
#     query_name = input()
