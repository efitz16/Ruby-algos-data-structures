# Big-O Complexity

## `LinkedList#new`

O(1) -- Only two instance variables are created, ever.

## `LinkedList#insert_first(element)`

O(1) -- Because self.first points to the first element, attaching a new first node is fast--just look for the first pointer. Even if the list grows, the worst that will happen is you need to make the new first node point to the old first node.

## `LinkedList#remove_first(element)`

O(1) -- Simply changing what the first pointer points to, and thus only need to locate this pointer.

## `LinkedList#insert_last(element)`

O(1) -- Simply locating the last pointer and changing what it points to. Worst case is that the old last will now have to point to the new last, but the process is expedited by having the "last" pointer. 

## `LinkedList#remove_last(element)`

O(n) -- To find the last element, we must traverse through the list. Thus, as the list grows, the time to perform the operation grows as well.

## `LinkedList#get(index)`

O(n) -- Because the pointer must traverse the list, the method's time increases as the list grows in size. Of course, best-case scenario is that the index to grab is very early in the list.

## `LinkedList#set(index, element)`

O(n) -- Once again, the pointer must traverse the list, so as the list grows, so does the time to perform the operation.

## `LinkedList#insert(index, element)`

O(n) -- This method also involves a pointer that must traverse the lost, so as the list grows, so does the time to perform the operation.

## `LinkedList#size`

O(n) -- Since this method *must* go through every element in the list, as the list increases, so does the time this method takes to run.

## Why is inserting a value into a LinkedList potentially faster than inserting a value into an ArrayList?

A LinkedList can dynamically expand and contract. To insert an element in the middle of the list, one only needs to traverse through half the LinkedList. An ArrayList, by comparison, must be traversed entirely as the elements are copied into the new, exanded ArrayList, since ArrayLists do not dynamiclly expand or contract.
