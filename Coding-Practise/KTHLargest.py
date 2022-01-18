def findKthLargest(nums, k):
    print(sorted(nums, reverse=True))
    nums = sorted(nums, reverse=True)
 
    # Return k'th element in the
    # sorted array
    return nums[k-1]

if __name__=='__main__':
    arr = [12, 3, 5, 7, 19]
    n = len(arr)
    k = 2
    print("K'th largest element is",
          findKthLargest(arr, k))
 