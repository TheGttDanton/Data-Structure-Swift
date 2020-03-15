class Trie {
    var isEndOfNode = false
    var map = [Character: Trie]()
}

func insert(_ myString: String, _ trie: Trie) {
    var trie = trie
    for char in myString {
        if let subTrie = trie.map[char] {
            trie = subTrie
        } else {
            let subTrie = Trie()
            trie.map[char] = subTrie
            trie = subTrie
        }
    }
    trie.isEndOfNode = true
}

func search(_ myString: String, _ trie: Trie) -> Bool {
    var trie = trie
    for char in myString {
        if let subTrie = trie.map[char] {
            trie = subTrie
        } else {
            return false
        }
    }
    return trie.isEndOfNode == true
}

let trie = Trie()
print(search("Emtiyaj", trie))
insert("Emtiyaj", trie)
insert("Emt", trie)
insert("Emtiyj", trie)
insert("myaj", trie)

print(search("Emtiyaj", trie))
print(search("Emtiyj", trie))
print(search("myaj", trie))
