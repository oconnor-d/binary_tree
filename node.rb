class Node
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value=nil, parent=nil, left_child=nil, rihgt_child=nil)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end

  def insert(value)
    if value < @value
      unless @left_child.nil?
        @left_child.insert(value)
      else
        @left_child = Node.new(value, self)
      end
    else
      unless @right_child.nil?
        @right_child.insert(value)
      else
        @right_child = Node.new(value, self)
      end
    end
  end

  def to_s
    if @left_child.nil? && @right_child.nil?
      return "#{@value}, l:[nil], r:[nil]"
    elsif @left_child.nil?
      return "#{@value}, l:[nil], r:[#{@right_child.to_s}]"
    elsif @right_child.nil?
      return "#{@value}, l:[#{@left_child.to_s}], r:[nil]"
    elsif !@value.nil?
      return "#{@value}, l:[#{@left_child.to_s}], r:[#{@right_child.to_s}]"
    else
       return nil
    end
  end
end
