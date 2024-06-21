require_relative 'node'

class BinarySearchTree
  attr_accessor :root, :size

  def initialize
    @root = nil
    @size = 0
  end

   # Add a value to the tree
  def add(value)
    @root = insert_at_node(@root, value)
    @size += 1
  end

  # Check if the tree contains a value
  def contains?(value)
    search(@root, value)
  end

   # Search for a value in the tree starting from a given node
  def search(node, value)
    if node.nil?
      return false
    end
      
    if node.value == value
      return true
    end
    
    return search(node.left, value) || search(node.right, value)
  end
 
 # Return the size of the tree
  def size
    return @size
  end

  # Function to do left-left rotaion on a given node
  def ll_rotate(node)
    temp = node.right
    node.right = temp.left
    temp.left = node
    temp
  end

  # Function to do Left-Left rotaion on a given node
  def rr_rotate(node)
    temp = node.left
    node.left = temp.right
    temp.right = node
    temp
  end
  
  # Insert a value into the tree starting from a root node
  def insert_at_node(root, value)
    if root.nil?
      root = Node.new(value)
      return root
    end

    if value == root.value
      return root
    end

    if value > root.value
      root.right = insert_at_node(root.right, value)
    else
      root.left = insert_at_node(root.left, value)
    end

    root.imbalance = heightAtNode(root.left) - heightAtNode(root.right)

    # Perform rotations to maintain AVL balance
    if root.imbalance > 1
      if root.left.imbalance >= 0
        root = rr_rotate(root)  # Right-right rotation
      else
        # Right_Left Rotation
        root.left = ll_rotate(root.left) # Left-left rotation on left child
        root = rr_rotate(root)  # Right-right rotation
      end
    end

    if root.imbalance < -1
      if root.right.imbalance <= 0
        root = ll_rotate(root)      # Left-left rotation
      else
        # Left-Right Rotation
        root.right = rr_rotate(root.right)    # Right-right rotation on right child
        root = ll_rotate(root)                # Left-left rotation
      end
    end

    return root

  end
  
  # Calculate the height of a node
  def heightAtNode(node)
    return 0 if node.nil?
  
    1 + [heightAtNode(node.left), heightAtNode(node.right)].max
  end

  # Return the height of the tree
  def height()
    return self.heightAtNode(@root)
  end

  # Print the tree starting from a given node with indentation
  def print_tree_at_node(node, level, prefix)
    unless node.nil?
      puts "#{' ' * (level * 4)}#{prefix}#{node.value}"
      if node.left || node.right
        if node.left
          print_tree_at_node(node.left, level + 1, 'L--- ')
        else
          puts "#{' ' * ((level + 1) * 4)}L--- None"
        end
        if node.right
          print_tree_at_node(node.right, level + 1, 'R--- ')
        else
          puts "#{' ' * ((level + 1) * 4)}R--- None"
        end
      end
    end
  end


  def print_tree
    print_tree_at_node(@root, 0, 'Root: ')
  end


end




# Example usage, uncomment the various cases
avl = BinarySearchTree.new
# values = [6,8,2,1,4,3,5]
values = [10, 20, 30, 40, 50, 25]
values.each { |value| avl.add(value) }

# This will print the tree in an undestandable form
puts "Tree structure:"
avl.print_tree