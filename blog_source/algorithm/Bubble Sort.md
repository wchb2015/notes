### Bubble Sort

1. 基本思路:比较相邻的元素.如果第一个比第二个大,就交换他们两个.针对所有的元素重复这个的方式,每轮(除了第一次)减去最后一个元素.

### 算法实现

```java
public static void sort_1(Comparable[] arr) {
        int length = arr.length;

        for (int i = 0; i < length - 1; i++) {
            for (int j = 0; j < length - i - 1; j++) {
                if (arr[j].compareTo(arr[j + 1]) > 0) {
                    SortUtil.swap(arr, j, j + 1);
                }
            }
        }
}

```

优化版V1.1
> 纯代码优化,将判断条件上移到for的布尔表达式里面.

```java
public void insertionSort() {

        Integer[] arr = new Integer[]{2, 3, 1, 9, 7, 4};

        Integer[] arr = new Integer[]{2, 3, 1, 9, 7, 4};
        for (int i = 1; i < arr.length; i++) {
            for (int j = i; j > 0 && arr[j - 1] > arr[j]; j--) {
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
```%