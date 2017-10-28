![](http://onf3binym.bkt.clouddn.com/17-10-22/87502155.jpg)
### Insertion Sort

1. 基本思路:寻找arr[i]合适的插入位置.
2. 插入排序和选择排序相比最大的不同在于内层循环可以提前结束.
3. 插入排序在数组完全有序时,是个O(n)级别的排序算法.

### 算法实现

```java
public void insertionSort() {

        Integer[] arr = new Integer[]{2, 3, 1, 9, 7, 4};
        
        for (int i = 1; i < arr.length; i++) {
            for (int j = i; j > 0; j--) {
                if (arr[j] < arr[j - 1]) {
                    swap(arr, j, j - 1);
                } else {
                    break;
                }
            }
        }
 } 

```

优化版V1.1

```java
public void insertionSort() {

        Integer[] arr = new Integer[]{2, 3, 1, 9, 7, 4};
        
        Integer[] arr = new Integer[]{2, 3, 1, 9, 7, 4};
        for (int i = 1; i < arr.length; i++) {
            for (int j = i; j > 0 && arr[j] < arr[j - 1]; j--) {
                swap(arr, j, j - 1);
            }
        }
} 
```

优化版V1.2
> 消除swap,因为1次swap有3次赋值.

```java
public void insertionSort() {

        Integer[] arr = new Integer[]{2, 3, 1, 9, 7, 4};

        for (int i = 1; i < arr.length; i++) {
            //寻找arr[i]合适的插入位置
            int e = arr[i];
            int j;//保存元素e应该插入的位置
            for (j = i; j > 0 && arr[j - 1] > e; j--) {
                arr[j] = arr[j - 1];
            }
            arr[j] = e;
        }
} 
```