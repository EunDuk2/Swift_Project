n = int(input())

for i in range(n):
    N, D, X = map(int, input().split())

    array = list(map(int, input().split()))

    index = D-1
    total_count = 0
    D_count = 0
    
    while True:
        if index == len(array):
            index = 0
        if D_count == array[D-1] and index == X:
            break
        if index == D-1:
            D_count += 1
        total_count += 1
        index += 1
        
        
    print(f"#{i+1} {total_count}")

