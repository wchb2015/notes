### Selection Sort
1. 基本思路:找出数组中的最小值,然后交换当前第一名和最小值.
2. 算法实现

```java
public void selectionSort() {

        Integer[] arr = new Integer[]{2, 3, 1, 9, 7, 4};
        
        for (int i = 0; i < arr.length; i++) {
            int minIndex = i;
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[j] < arr[minIndex]) {
                    minIndex = j;
                }
            }
            if (i != minIndex) {
                swap(arr, i, minIndex);
            }
        }
} 

```
