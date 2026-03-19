
class Node {
    var nodes:[Node?]
    var isEnd: Bool
    init(){
        self.nodes = Array(repeating:nil, count:26)
        self.isEnd = false
    }

}

class Trie {
    var root: Node
    init() {
        self.root = Node()
    }
    
    func insert(_ word: String) {
        var str = Array(word)
        var node:Node?  = root
        for char in word {
            let index =  Int(char.asciiValue! - 97)
            if node?.nodes[index] == nil {
                node?.nodes[index] = Node()
            }
            node = node?.nodes[index]
        }
        node?.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        let node = searchPrefix(word)
        return node != nil && (node?.isEnd ?? false )
    }

    
    func startsWith(_ prefix: String) -> Bool {
        let node = searchPrefix(prefix)
        return node != nil
    }

    func searchPrefix(_ prefix: String) -> Node? {
        var node:Node? = root
        for char in prefix {
             let index =  Int(char.asciiValue! - 97)
            if node?.nodes[index] != nil {
                 node = node?.nodes[index]
            } else {
                return nil
            }
        }
        return node
    }

    
}
