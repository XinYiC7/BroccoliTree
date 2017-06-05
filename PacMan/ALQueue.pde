
/*****************************************************
 * class ALQueue
 * uses an ArrayList to implement abstract data type QUEUE
 * (a collection with FIFO property)
 *
 *       -------------------------------
 *   end |  --->   Q U E U E   --->    | front
 *       -------------------------------
 *
 ******************************************************/

import java.util.ArrayList;

class ALQueue<T> 
{
  ArrayList<T> _queue;

  // default constructor
  ALQueue() { 
    _queue = new ArrayList<T>();
  }


  // means of adding an item to collection 
  void enqueue( T x ) 
  {
    _queue.add(x);
  }//O(1)


  // means of removing an item from collection 
  T dequeue() 
  {
    T ret = _queue.get(0);
    _queue.remove(0);
    return ret;
  }//O(n)


  // means of "peeking" at the front item
  T peek() 
  {
    return _queue.get(0);
  }//O(1)


  // means of checking to see if collection is empty
  boolean isEmpty() 
  {
    return _queue.size() <= 0;
  }//O(1)
}//end class ALQueue