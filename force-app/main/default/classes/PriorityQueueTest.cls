@isTest
public class PriorityQueueTest {
  static testMethod void testPriorityQueue() {
    // Create a new priority queue
    PriorityQueue queue = new PriorityQueue();

    // Add elements to the queue
    queue.add(10);
    queue.add(20);
    queue.add(30);

    // Checks that the queue size is correct
    System.assertEquals(3, queue.heap.size());

    // Checks the highest priority element without removing it
    System.assertEquals(30, queue.peek());

    // Removes the highest priority element
    System.assertEquals(30, queue.poll());

    // Checks that the queue size is correct after removal
    System.assertEquals(2, queue.heap.size());

    // Checks that the queue is not empty
    System.assertEquals(false, queue.isEmpty());

    // Removes the next highest priority element
    System.assertEquals(20, queue.poll());

    // Checks that the queue size is correct after removal
    System.assertEquals(1, queue.heap.size());

    // Checks that the queue is not empty
    System.assertEquals(false, queue.isEmpty());

    // Removes the last element from the queue
    System.assertEquals(10, queue.poll());

    // Checks that the queue size is correct after removal
    System.assertEquals(0, queue.heap.size());

    // Check if the queue is empty
    System.assertEquals(true, queue.isEmpty());

    // Checks if exception is thrown when calling `peek` on empty queue
    Boolean caughtException = false;
    try {
      queue.peek();
    } catch (PriorityQueue.PriorityQueueException e) {
      caughtException = true;
    }
    System.assertEquals(true, caughtException);

    // Checks if exception is thrown when calling `poll` on empty queue
    caughtException = false;
    try {
      queue.poll();
    } catch (PriorityQueue.PriorityQueueException e) {
      caughtException = true;
    }
    System.assertEquals(true, caughtException);
  }
}