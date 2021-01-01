
# boj 10815
import sys

#교수님 바이너리서치 코드
# def binary_search(A, k):
#     if len(A) <1 :return False
#     m = len(A)//2
#     if A[m] == k:
#         return True
#     elif A[m] < k:
#         return binary_search(A[m+1:], k)
#     else:
#         return binary_search(A[:m], k)


#인터넷 바이너리서치
def binary_search(target, data):
    start = 0
    end = len(data) - 1

    while start <= end:
        mid = (start + end) // 2

        if data[mid] == target:
            return True 
        elif data[mid] < target:
            start = mid + 1
        else:
            end = mid -1

    return False

n = int(sys.stdin.readline())
card = list(map(int, sys.stdin.readline().split( )))
card.sort()
number = int(sys.stdin.readline())
numbers = list(map(int, sys.stdin.readline().split( )))

for i in range(len(numbers)):
    if i!= len(numbers)-1 :
        if binary_search(numbers[i], card):
            print(1, end = " ")
        else:
            print(0, end = " ")
    else:
        if binary_search(numbers[i], card):
            print(1, end = "")
        else:
            print(0, end = "")