# Syntax Junior Software Engineer Assignment

Thank you for taking the time to apply for this position at Syntax. To help us
evaluate applicants, we've put together this short binary search tree assignment.
You'll spend some time writing code in our primary development language, Ruby.
Prior experience with Ruby is not required, and we've provided a framework for
you to work in, as well as some resources to help you on your way. We estimate
the assignment will take about 1.5 hours depending on your familiarity with the
concepts involved.

## Setup
To work on this assignment, you'll need to setup a ruby environment. This
framework was made for Ruby version `3.2.2`, but should work just fine with older
versions of Ruby 3. 

If you're working on Windows, we recommend using the Windows Subsystem for Linux.

On most systems, you can install Ruby using [rbenv](https://github.com/rbenv/rbenv). Follow their guide to get started.

Once installed you can change directory to the root of this assignment and run the following commands to get setup:
```shell
gem install bundler
bundle install
```

Once bundler installs dependencies you should see a message that reads:
```
Bundle complete! 5 Gemfile dependencies, 23 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

## Project Overview
```shell
├── Gemfile # Defines ruby dependencies for the project.
├── Gemfile.lock # Defines locked versions of dependencies that will be installed.
├── README.md
├── Rakefile # Defines tasks that this project runs, like tests.
├── lib # This directory stores your implementation for the BST.
│   ├── binary_search_tree.rb
│   └── node.rb
├── setup.rb # Sets up the environment and loads dependencies.
└── test # Any test files for your implementations can go here.
    ├── binary_search_tree_test.rb
    └── helper.rb # The helper provides a baseline to setup and run tests.
```

The only files you should need to change are the BST implementation in `lib` and
`test/binary_search_tree_test.rb` where you can add your own tests for the tree.
If you wish to test other classes or ruby files you've implemented, you can add additional
test files and they will automatically be run. All test files must end in `_test.rb` and
their first line must be `require 'helper'`.

### Running Tests
You can run the test suite by running `bundle exec rake test` at the root of the project.
Initially, all your tests will be failing.

### Interactive Ruby Console
You can play around with Ruby, and mess with your binary search tree implementation
by running `bundle exec rake console`.

```shell
rake console
irb(main):001> tree = BinarySearchTree.new
=> #<BinarySearchTree:0x00000001098b88f0 @root=nil>
irb(main):002> tree.add("Hello, World!")
=> #<Node:0x000000010999d400 @value="Hello, World!">
irb(main):003> tree.contains?("Hello, World!")
=> true
```

### Debugging
The console is a great way to do exploratory programming and debugging,
but sometimes you need to debug a test. You can add `binding.pry` anywhere
in your ruby code to open up an interactive debugger at that line of code,
similar to the interactive console.

If you then run `bundle exec rake test`, you'll stop at the breakpoint you set
and will be able to interact with your code. The debugger provides extra commands
you can use to debug your code. Type `help` when at a breakpoint to see them.
Commonly used ones are `step` to step into a method call, `next` to execute the next line of code,
and `continue` to keep running the program until the next breakpoint.

```shell
bundle exec rake test
Run options: --seed 14696

# Running:
From: /.../binary_search_tree/lib/binary_search_tree.rb:8 BinarySearchTree#initialize:

    6: def initialize
    7:   binding.pry
 => 8:   @root = nil
    9: end

[1] pry(#<BinarySearchTree>)> @root
=> nil
[2] pry(#<BinarySearchTree>)> self
=> #<BinarySearchTree:0x0000000106eb73f8>
```

## Building the Self-Balanced Binary Search Tree
Your goal is to build a partial implementation of a [binary search tree](https://en.wikipedia.org/wiki/Binary_search_tree)
that works with strings in Ruby. The tree will balance itself to keep search operations fast.
This particular type of tree is called an [AVL tree](https://en.wikipedia.org/wiki/AVL_tree).

The tree should store elements sorted by an alphabetical order, and automatically rebalance 
itself with each insert. You only need to implement the required functionality to get the 4
methods provided in the `BinarySearchTree` class working. This means you don't need to worry
about removing items from the tree.

You may use internet resources like Google and Stack Overflow to learn about AVL trees, and Ruby concepts.
However, your answer must be yours alone. Do not use other people's solutions, or generative AI. Solutions from
generative AI are often obvious, and poorly structured. Think carefully about how you want to design your
tree and code to keep it concise, well organized, and easy to understand. Document your methods, and their purpose.

We've provided a largely empty class, and a test framework to get you started. Here's a suggested order to take things:

1. Design a representation for your tree structure.
2. Implement `BinarySearchTree#add`. This should insert a string into your tree. If a string is already in the tree, you can just do nothing. Do not insert duplicates into the tree.
3. Implement `BinarySearchTree#contains?` This should check if the provided string exists somewhere in the tree.
4. Implement `BinarySearchTree#size`. This should return the total number of elements in the tree.
5. Implement `BinarySearchTree#height`. This should compute the height of the tree.
6. Augment `BinarySearchTree#add` so that the tree keeps itself balanced as new nodes are inserted.
7. Add additional tests to cover important cases.

### Additional Resources
* [Ruby String Documentation](https://docs.ruby-lang.org/en/3.2/String.html)
* [Ruby Cheatsheet](https://github.com/lifeparticle/Ruby-Cheatsheet)
* [Minitest Cheatsheet](https://chriskottom.com/resources/cheatsheets_free.pdf), Note: We're using assert-style tests.

## Closing Questions
Please answer the following questions, either directly in this file, or in an `answers.md` file in this directory.

1. How did you decide to keep the tree balanced?
2. On average, what is the time complexity for insertions made to the tree?
3. On average, what is the time complexity for checking the existence of an element in the tree?
4. Why might it be a bad idea to insert duplicates into the search tree? If you wanted to keep track of duplicate insertions, what might be a good way to augment your implementation?
5. Did you need to have special considerations in your implementation to make the tree work with strings? Would your tree work with integers instead?
6. Suppose we wanted to use this with more complex ruby objects. Is there an interface we could design that makes objects compatible with the tree?
7. How did you decide upon new tests to add to the test suite? 
8. Which parts, if any, of this assignment were most challenging? Why?

## Submission
To submit, zip up the entire directory and send it via email to `cthomas@syntaxdata.com`. Please include your full name with your submission.
