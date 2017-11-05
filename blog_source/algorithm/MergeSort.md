![](http://onf3binym.bkt.clouddn.com/17-10-26/63471529.jpg)
### Merge Sort

1. 基本思路:首先二分数组,然后分别对左右数组进行排序,最后将他们归并起来.当然,在对左右数组排序时会分别再二分左右的数组,直到每一部分只有一个元素时,该部分本身有序,进行归并即可.
2. 一共n个元素,层级是log(n),如果n!=2^x,那么log(n)为浮点数,结果需要向上取整.
3. 归并排序的本质是一个递归的排序过程.
4. 归并过程
![归并过程](http://oylc9q7dv.bkt.clouddn.com/20171030/QY5WXT1BXdB12E1GC9bG4uUd.png) 

### 算法实现
```
    //入口
    public void mergeSort(Integer[] arr) {
        _mergeSort(arr, 0, arr.length - 1);
    }

    //递归使用归并排序,对arr[l...r]的范围进行排序
    private void _mergeSort(Integer[] arr, int l, int r) {
        if (l >= r) {
            return;
        }

        int mid = (l + r) / 2;
        _mergeSort(arr, l, mid);
        _mergeSort(arr, mid + 1, r);

        _merge(arr, l, mid, r);
    }

    //将arr[l...mid]和arr[mid+1...r]两部分进行归并
    private void _merge(Integer[] arr, int l, int mid, int r) {
        Integer[] aux = new Integer[r - l + 1];
        for (int i = l; i <= r; i++) {
            aux[i - l] = arr[i];
        }

        int i = l, j = mid + 1;
        for (int k = l; k <= r; k++) {
            if (i > mid) {
                arr[k] = aux[j - l];//如果左半部分元素已经全部处理完毕
                j++;
            } else if (j > r) {
                arr[k] = aux[i - l];//如果右半部分元素已经全部处理完毕
                i++;
            } else if (aux[i - l] < aux[j - l]) {//左半部分<右半部分
                arr[k] = aux[i - l];
                i++;
            } else {
                arr[k] = aux[j - l];//左半部分>右半部分
                j++;
            }
        }
    }
```

优化版V1.1
> 只有当arr[mid]>arr[mid+1] 才进行归并

```
// 对于近乎有序的数组非常有效,但是对于一般情况,有一定的性能损失
 if (arr[mid] > arr[mid + 1]) {
     _merge(arr, l, mid, r);
 }
```

优化版V1.2
> 对于小规模数组, 使用插入排序

```
if (r - l <= 15) {
    InsertionSort.sort(arr, l, r);
    return;
}
```

### 自底向上的MergeSort

```
 public static void sort(Comparable[] arr) {

        int n = arr.length;

        //Merge Sort Bottom Up 无优化版本
        for (int sz = 1; sz < n; sz *= 2) {
            for (int i = 0; i + sz < n; i += sz + sz) {
                // 对 arr[i...i+sz-1] 和 arr[i+sz...i+2*sz-1] 进行归并
                merge(arr, i, i + sz - 1, Math.min(i + sz + sz - 1, n - 1));
                logger.info("sz:{},i:{},mid:{},r:{}", sz, i, i + sz - 1, Math.min(i + sz + sz - 1, n - 1));
            }
        }

       /* // Merge Sort Bottom Up 优化
        // 对于小数组, 使用插入排序优化
        for (int i = 0; i < n; i += 16) {
            logger.info("i:{}", i);
            InsertionSort.sort(arr, i, Math.min(i + 15, n - 1));
            logger.info("arr:{}", Arrays.asList(arr));
        }

        for (int sz = 16; sz < n; sz += sz) {
            for (int i = 0; i < n - sz; i += sz + sz) {
                logger.info("________i:{}", i);
                // 对于arr[mid] <= arr[mid+1]的情况,不进行merge
                if (arr[i + sz - 1].compareTo(arr[i + sz]) > 0) {
                    merge(arr, i, i + sz - 1, Math.min(i + sz + sz - 1, n - 1));
                }
            }
        }*/

}
```