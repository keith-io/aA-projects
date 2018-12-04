require 'byebug'
class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        unless parent.nil? 
            parent.children.reject! { |child| child == self }
        end
        @parent = parent_node
        parent.children << self unless parent.nil? || parent.children.include?(self)
    end

    def add_child(child)
        child.parent = self
        self.children << child unless self.children.include?(child)
    end

    def remove_child(child)
        raise ArgumentError if !self.children.include?(child)
        self.children.each { |child| child.parent = nil if child == child }
    end

    def dfs(target_value)
        return self if self.value == target_value

        return nil if self.children.nil?
        self.children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        
        until queue.empty?
            return queue.first if queue.first.value == target_value
            queue += queue.first.children
            queue.shift
        end
        nil
    end
end