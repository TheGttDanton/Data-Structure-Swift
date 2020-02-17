let text = "mamdasm"

func longestPalindromicSubString(_ currentCount: Int,_ startIndex: Int,_ endIndex: Int) -> Int {
    if startIndex == endIndex {
        return 1 + currentCount
    } else if startIndex > endIndex {
        return currentCount
    }

    let start = text.index(text.startIndex, offsetBy: startIndex)
    let end = text.index(text.startIndex, offsetBy: endIndex)

    var matchCase = 0
    if text[start] == text[end] {
        matchCase = longestPalindromicSubString(currentCount + 2, startIndex + 1, endIndex - 1)
    }

    let takeStart = longestPalindromicSubString(0, startIndex , endIndex - 1)
    let takeEnd = longestPalindromicSubString(0, startIndex + 1, endIndex )

    let maxOfMisMatch = takeStart > takeEnd ? takeStart : takeEnd
    return matchCase > maxOfMisMatch ? matchCase : maxOfMisMatch
}

let longestSeq = longestPalindromicSubString(0, 0, text.count - 1)
print(longestSeq)