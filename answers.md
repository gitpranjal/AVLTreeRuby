1. How did you decide to keep the tree balanced?

The tree was balanced after each insertion by performing ratations. Deoending upon the the state of the tree, one of the four types of tree rotations were performed, Left-Left Rotation, Left-Right rotation, Right_left rotation, Right-Right rotation.


2. On average, what is the time complexity for insertions made to the tree?
For each node, the time complexity of insertion will be O(logN), where N is the current number of nodes in the tree. 
Explaination:
The process of inserting a node involes

a. Inserting the node  - O(log N), since the node will go to the max depth of the tree which is O(log N) in case of AVL Trees

b. Updating imbalance factor of the root after insertion which involves calculating height of left and right subtree - O(logN)

c. Performing Rotations - O(1)

Hence overall compelxity is O(logN) + O(1) = O(logN)

To insert N nodes, the complexity will be O(NlogN)

3. On average, what is the time complexity for checking the existence of an element in the tree?
Since the tree is balanced, the worst time complexity will be no mire than O(logN), were N is the number of elements in the tree. The search complexity in a binary tree depends upon the height of the tree. Since the tree is balnced, the max height the tree can assume is O(logN)


4. Why might it be a bad idea to insert duplicates into the search tree? If you wanted to keep track of duplicate insertions, what might be a good way to augment your implementation?
Introducing duplicates might increase the complexity in terms of implementation of the AVL tree, if we deceide to maintain a seperate node for each duplicate. 
We can use something like a `count` variable in each node to account for the count of each value in the tree. 

5. Did you need to have special considerations in your implementation to make the tree work with strings? Would your tree work with integers instead?
In Ruby, the string comparision by default is taken care of lexicographically using >, < signs. Hence I didn't need to implement a custom function to get lexicographic value out of strings to compare them upon.

6. Suppose we wanted to use this with more complex ruby objects. Is there an interface we could design that makes objects compatible with the tree?
In case we want our nodes to be more complex object, they must have an attribute upon which they can be compared. For this, we can dsign an interface that makes sure that the classes implementing it, are implementing a function that returns a comparable value, that can be used for comparision.

For example, the inyerface can make the presence of "value" method mandatory in the classes implementing it. That means, the complex objects that we want to use as nodes will have a "value" method that will return the value upon which node will be compared with other nodes while insertion.

7. How did you decide upon new tests to add to the test suite? 
Since tree rotations are an important event happenning in AVL trees, I added four tests to test all the four types of rotations mentioned above. To test each type of rotation, I added values to the tree accordingly and checked if the height of the tree adhered to the balanced tree height expectation or not.

Have also added a print function to prettu print the tree to look at the tree structure after every insertion.

8. Which parts, if any, of this assignment were most challenging? Why?

Insertion was the most challenging part of the assignment due to number of comaprisions and cases involved. It involved handling four cases of tree rotation that made it a bit complex.