class BSTNode
  attr_accessor :left, :right
  attr_reader :value
  def initialize(value)
    @value = value
    @left, @right = nil, nil
  end
end
