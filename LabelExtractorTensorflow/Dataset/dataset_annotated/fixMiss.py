import glob

arr = glob.glob("*.jpg")
arr = [f.split(".")[0] for f in arr]
# print(arr)

arr1 = glob.glob("*.xml")
arr1 = [f.split(".")[0] for f in arr1]
# print(arr1)

diff = set(set(arr1) - set(arr))
print(diff)

diff = set(set(arr) - set(arr1))
print(diff)