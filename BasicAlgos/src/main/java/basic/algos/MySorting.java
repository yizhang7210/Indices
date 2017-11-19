package basic.algos;

import java.util.Arrays;

public class MySorting {

    public int[] array;

    public MySorting(int[] arr) {
        this.array = arr;
    }

    /**
     * Insertion sort.
     */
    public void insertionSort() {

        array[0] = -90;

        for (int i = 1; i < array.length; ++i) {
            int tmp = array[i];

            int j = i - 1;
            while (j >= 0 && tmp < array[j]) {
                array[j + 1] = array[j];
                j = j - 1;
            }
            array[j + 1] = tmp;
        }

    }

    /**
     * Merge sort.
     */
    public void mergeSort(int start, int finish) {

        if (start < finish) {
            int mid = (start + finish) / 2;
            this.mergeSort(start, mid);
            this.mergeSort(mid + 1, finish);
            this.merge(start, mid, finish);
        }

    }

    public void merge(int start, int mid, int finish) {

        int[] left = new int[mid - start + 1];
        int[] right = new int[finish - mid + 1];

        for (int i = 0; i < left.length - 1; ++i) {
            left[i] = array[start + i];
        }

        left[mid - start] = Integer.MAX_VALUE;

        for (int j = 0; j < right.length - 1; ++j) {
            right[j] = array[mid + j];
        }

        right[finish - mid] = Integer.MAX_VALUE;

        int l = 0;
        int r = 0;
        for (int i = start; i < finish; ++i) {
            if (left[l] < right[r]) {
                array[i] = left[l];
                l = l + 1;
            } else {
                array[i] = right[r];
                r = r + 1;
            }
        }

    }

    /**
     * Bubble sort.
     */
    public void bubbleSort() {

        for (int i = 0; i < array.length - 2; i++) {
            for (int j = array.length - 1; j > i; j--) {
                if (array[j] < array[j - 1]) {
                    int tmp = array[j];
                    array[j] = array[j - 1];
                    array[j - 1] = tmp;
                }
            }
        }

    }

    /**
     * Heap Sort.
     */
    public static void maxHeapify(MyHeap A, int i) {
        int l = A.left(i);
        int r = A.right(i);
        int largest = i;

        if (l < A.heapsize && A.arr[l] > A.arr[i]) {
            largest = l;
        }

        if (r < A.heapsize && A.arr[r] > A.arr[largest]) {
            largest = r;
        }
        if (largest != i) {
            int tmp = A.arr[i];
            A.arr[i] = A.arr[largest];
            A.arr[largest] = tmp;

            MySorting.maxHeapify(A, largest);
        }
    }

    public static void buildHeap(MyHeap A) {
        A.heapsize = A.length;

        for (int i = A.length / 2; i >= 0; i--) {
            MySorting.maxHeapify(A, i);
        }

    }

    public int[] heapSort() {

        MyHeap A = new MyHeap(array);

        MySorting.buildHeap(A);

        for (int i = A.length - 1; i > 0; i--) {
            int tmp = A.arr[i];
            A.arr[i] = A.arr[0];
            A.arr[0] = tmp;

            A.heapsize = A.heapsize - 1;
            MySorting.maxHeapify(A, 0);
        }

        return A.arr;
    }

    /**
     * Quick sort.
     */
    public int partition(int l, int r) {
        int x = array[r];

        int i = l - 1;
        for (int j = l; j < r; ++j) {
            if (array[j] <= x) {
                i++;
                int tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
            }
        }
        int tmp = array[i + 1];
        array[i + 1] = array[r];
        array[r] = tmp;

        return i + 1;
    }

    public void quickSort(int l, int r) {
        if (l < r) {
            int m = this.partition(l, r);
            this.quickSort(l, m - 1);
            this.quickSort(m + 1, r);
        }
    }

    /**
     * Sort Test.
     */
    public static void sortTests() {
        
        System.out.println("==========Sort tests==========");
        int[] arr = {3, 1, 5, -54, 4, 32, 0};

        // Insertion Sort.
        MySorting a = new MySorting(arr);
        a.insertionSort();
        System.out.println("Insertion sort:");
        System.out.println(Arrays.toString(a.array));

        // Merge Sort.
        MySorting b = new MySorting(arr);
        b.mergeSort(0, b.array.length);
        System.out.println("Merge sort:");
        System.out.println(Arrays.toString(b.array));

        // Bubble Sort.
        MySorting c = new MySorting(arr);
        c.bubbleSort();
        System.out.println("Bubble sort:");
        System.out.println(Arrays.toString(c.array));

        // Heap Sort.
        MySorting d = new MySorting(arr);
        System.out.println("Heap sort:");
        System.out.println(Arrays.toString(d.heapSort()));

        // Quick Sort.
        MySorting e = new MySorting(arr);
        e.quickSort(0, e.array.length - 1);
        System.out.println("Quick sort:");
        System.out.println(Arrays.toString(e.array));
    }

}
