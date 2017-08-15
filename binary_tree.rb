require "./node"

class BinaryTree
  def initialize(data=nil)
    unless data.nil?
      build_tree(data)
    else
      @root = nil
    end
  end

  # inserts all of the given data into this tree
  def build_tree(data)
    @root = Node.new(data[0])
    data.shift
    data.each { |value| @root.insert(value) }
  end

  def breadth_first_search(value)
    search(value) { |list| list.shift }
  end

  def depth_first_search(value)
    search(value) { |list| list.pop }
  end

  def dfs_rec(value)
    dfs_rec_help(value, @root)
  end

  def print_tree
    unless @root.nil?
      puts @root.to_s
    else
      puts "nil"
    end
  end

  private

  # searches the tree in the order, according to the given block
  def search(value, &block)
    work_list = [@root]

    while !work_list.empty?
      curr_node = yield(work_list)

      unless curr_node.value == value
        work_list << curr_node.left_child unless curr_node.left_child.nil?
        work_list << curr_node.right_child unless curr_node.right_child.nil?
      else
        return curr_node
      end
    end

    return nil
  end

  def dfs_rec_help(value, node)
    if node.nil? || node.value == value
      return node
    else
      result = dfs_rec_help(value, node.right_child)
      result = dfs_rec_help(value, node.left_child) if result.nil?
      return result
    end
  end
end
