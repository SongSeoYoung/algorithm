# boj 11047

import sys
priceNumber = sys.stdin.readline().split(" ")
n = int(priceNumber[0])
# print(n)
price = int(priceNumber[1])
# print(price)
coin = []
for i in range(n):
    coin.append(int(sys.stdin.readline()))
# print(coin)
coin.sort(reverse=True)
count = 0
for i in range(len(coin)):
    # print(price)
    if price == 0:
        break
    elif price >= coin[i]:
        count += int(price / coin[i])
        price = price % coin[i]
        # print(price)
        # print(count)
    else:
        continue
print(count)