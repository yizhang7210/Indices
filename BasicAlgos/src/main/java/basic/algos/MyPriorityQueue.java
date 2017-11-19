package basic.algos;

import java.util.Arrays;

public class MyPriorityQueue {

    public int size;
    public MyHeap heap;

    public MyPriorityQueue(int[] queue) {
        this.heap = new MyHeap(queue);
        this.size = queue.length;

        MySorting.buildHeap(this.heap);
    }

    public void print() {
        this.heap.print();
    }

    public int max() {
        return this.heap.arr[0];
    }

    public int extractMax() {
        if (this.heap.heapsize < 1) {
            System.out.println("Error: Heap Overflow");
            return Integer.MAX_VALUE;
        }
        int max = this.heap.arr[0];

        this.heap.arr[0] = this.heap.arr[this.heap.heapsize - 1];
        this.heap.heapsize = this.heap.heapsize - 1;

        MySorting.maxHeapify(this.heap, 0);

        return max;
    }

    public void increaseKey(int i, int key) {
        if (this.heap.arr[i] > key) {
            System.out.println("Error: Key smaller than original value.");
            return;
        }

        this.heap.arr[i] = key;

        while (i > 0 && this.heap.arr[this.heap.parent(i)] < this.heap.arr[i]) {
            int tmp = this.heap.arr[i];
            this.heap.arr[i] = this.heap.arr[this.heap.parent(i)];
            this.heap.arr[this.heap.parent(i)] = tmp;

            i = this.heap.parent(i);
        }

    }

    public void insert(int key) {
        this.heap = new MyHeap(Arrays.copyOf(this.heap.arr, this.heap.length + 1));
        this.heap.arr[this.heap.length - 1] = Integer.MIN_VALUE;

        this.increaseKey(this.heap.length - 1, key);

    }

    public static void myPriorityQueueTest() {
        
        System.out.println("==========Priority Queue Test==========");
        int[] queue = {10, 4, 16, 7, 3, 9, 14, 2, 8, 1};
        MyPriorityQueue q = new MyPriorityQueue(queue);

        q.print();
        q.insert(150);
        q.print();
        System.out.println("Max is: " + q.max());
        int max = q.extractMax();
        System.out.println(max);
        q.print();
    }

}
