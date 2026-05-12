class Node {
    let val: Int
    var next: Node?
    var down: Node?
    init(val: Int, next: Node? = nil, down: Node? = nil) {
        self.val = val
        self.next = next
        self.down = down
    }
}

class Skiplist {
    private var head: Node?
    private let maxLevel = 16 // Sufficient for 2^16 elements

    init() {
        head = Node(val: -1)
    }

    func search(_ target: Int) -> Bool {
        var cur = head
        while let node = cur {
            // Move right
            while let nextNode = node.next, nextNode.val < target {
                cur = nextNode
            }
            // Check if found
            if let nextNode = cur?.next, nextNode.val == target {
                return true
            }
            // Move down
            cur = cur?.down
        }
        return false
    }

    func add(_ num: Int) {
        var stack = [Node]()
        var cur = head
        
        // Traverse and keep track of the path
        while let node = cur {
            var temp = node
            while let nextNode = temp.next, nextNode.val < num {
                temp = nextNode
            }
            stack.append(temp)
            cur = temp.down
        }
        
        var isInsertUp = true
        var downNode: Node? = nil
        
        while isInsertUp && !stack.isEmpty {
            let prev = stack.removeLast()
            let newNode = Node(val: num, next: prev.next, down: downNode)
            prev.next = newNode
            downNode = newNode
            isInsertUp = Bool.random()
        }
        
        // If we still need to go up but ran out of levels, add one new level
        if isInsertUp && stack.count < maxLevel {
            let newNode = Node(val: num, next: nil, down: downNode)
            head = Node(val: -1, next: newNode, down: head)
        }
    }

    func erase(_ num: Int) -> Bool {
        var cur = head
        var found = false
        while let node = cur {
            var temp = node
            while let nextNode = temp.next, nextNode.val < num {
                temp = nextNode
            }
            
            if let nextNode = temp.next, nextNode.val == num {
                found = true
                temp.next = nextNode.next // Delete node at this level
            }
            cur = temp.down
        }
        return found
    }
}