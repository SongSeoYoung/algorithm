# # boj 1431

number = int(input())
arr = []

for i in range(number):
    string = input()
    n= 0 
    for j in string:
        if j.isdigit():
            n += int(j)
    arr.append((string, n))

arr.sort(key=lambda x: (len(x[0]), x[1], x[0]))

for i in range(len(arr)):
    print(i[0])