class Node
  attr_accessor :value, :left, :right, :imbalance
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @imbalance = 0
  end

end