require 'helper'

class BinarySearchTreeTest < TestCase

  setup do
    @tree = BinarySearchTree.new
  end

  test 'can add root the element to the tree' do
    @tree.add("hello")
    assert @tree.contains?("hello")
  end

  test 'detects if an element exists in the tree' do
    assert_not @tree.contains?("hello")

    @tree.add("hello, world")
    @tree.add("hello, there")
    @tree.add("goodbye")

    assert_not @tree.contains?("hello")

    @tree.add("hello")

    assert @tree.contains?("hello")
  end

  test 'calculates the height of the tree' do
    assert_equal 0, @tree.height

    @tree.add("hello")
    assert_equal 1, @tree.height

    @tree.add("world")
    assert_equal 2, @tree.height
  end

  test 'it balances the tree when inserting right' do
    @tree.add("hello")
    @tree.add("hello, there")
    @tree.add("hello, world")

    assert_equal 2, @tree.height
  end

  test 'it balances the tree when inserting left' do
    @tree.add("hello, world")
    @tree.add("hello, there")
    @tree.add("hello")


    assert_equal 2, @tree.height
  end

  test 'calculates the number of elements in the tree' do
    @tree.add("hello")
    @tree.add("hello, there")
    @tree.add("hello, world")

    assert_equal 3, @tree.size
  end


  ############################### Added Tests to test all types of rotations ###########
  
  test 'performs left-right rotation' do
    @tree.add(5)
    @tree.add(3)
    @tree.add(4)  
  
    assert @tree.contains?(5)
    assert @tree.contains?(3)
    assert @tree.contains?(4)
    assert_equal 2, @tree.height    # testing Left-Right Rotation
  end


  test 'performs right-left rotation' do
    @tree.add(3)
    @tree.add(5)
    @tree.add(4)  
  
    assert @tree.contains?(5)
    assert @tree.contains?(3)
    assert @tree.contains?(4)
    assert_equal 2, @tree.height    # testing Rigt-Left Rotation
  end

  test 'performs left-left (LL) rotation' do
    @tree.add(5)
    @tree.add(4)
    @tree.add(3)  
  
    assert @tree.contains?(5)
    assert @tree.contains?(4)
    assert @tree.contains?(3)
    assert_equal 2, @tree.height  #Left-Left (LL) Rotation Test
  end
  
  test 'performs right-right (RR) rotation' do
    @tree.add(3)
    @tree.add(4)
    @tree.add(5)  
  
    assert @tree.contains?(5)
    assert @tree.contains?(4)
    assert @tree.contains?(3)
    assert_equal 2, @tree.height  #Right-Right (RR) Rotation Test
  end
  


end
