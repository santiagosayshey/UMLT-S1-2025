import numpy

def calculate_average(filename):

    with open(filename, "r") as file:
        nums = file.read().split()

        sum = 0
        for num in nums:
            sum += float(num)

        return sum / len(nums)


# Test your function
filename = "data.txt"
avg = calculate_average(filename)
print(avg)