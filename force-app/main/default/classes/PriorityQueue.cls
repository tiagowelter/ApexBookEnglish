public class PriorityQueue {
    public List<Integer> heap;
  
    public PriorityQueue() {
      this.heap = new List<Integer>();
    }
  
    // Adds an element to the queue
    public void add(Integer value) {
      heap.add(value);
      Integer currentIndex = heap.size() - 1;
      Integer parentIndex = (currentIndex - 1) / 2;
      while (currentIndex > 0 && heap.get(currentIndex) > heap.get(parentIndex)) {
        swap(currentIndex, parentIndex);
        currentIndex = parentIndex;
        parentIndex = (currentIndex - 1) / 2;
      }
    }
  
    // Removes and returns the highest priority element (the heap root)
    public Integer poll() {
      if (heap.isEmpty()) {
        throw new PriorityQueueException('The queue is empty');
      }
      Integer result = heap.get(0);
      heap.set(0, heap.get(heap.size() - 1));
      heap.remove(heap.size() - 1);
      heapifyDown();
      return result;
    }
  
    // Returns the highest priority element without removing it
    public Integer peek() {
      if (heap.isEmpty()) {
        throw new PriorityQueueException('The queue is empty');
      }
      return heap.get(0);
    }
  
    // Check if the queue is empty
    public Boolean isEmpty() {
      return heap.isEmpty();
    }
  
    private void heapifyDown() {
      Integer currentIndex = 0;
      Integer leftChildIndex = 2 * currentIndex + 1;
      Integer rightChildIndex = 2 * currentIndex + 2;
      Integer largestIndex = currentIndex;
      while (leftChildIndex < heap.size()) {
        if (heap.get(leftChildIndex) > heap.get(largestIndex)) {
          largestIndex = leftChildIndex;
        }
        if (rightChildIndex < heap.size() && heap.get(rightChildIndex) > heap.get(largestIndex)) {
          largestIndex = rightChildIndex;
        }
        if (largestIndex == currentIndex) {
          break;
        }
        swap(currentIndex, largestIndex);
        currentIndex = largestIndex;
        leftChildIndex = 2 * currentIndex + 1;
        rightChildIndex = 2 * currentIndex + 2;
      }
    }
  
    private void swap(Integer i, Integer j) {
      Integer temp = heap.get(i);
      heap.set(i, heap.get(j));
      heap.set(j, temp);
    }
  
    // Exception for empty queue
    private class PriorityQueueException extends Exception {}
}