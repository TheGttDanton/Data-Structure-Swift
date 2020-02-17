let text = "AMEEWMEA"

func longestCommonSubSeq(_ startIndex: Int, _ endIndex: Int) -> Int {
    if startIndex == endIndex {
        return 1
    } else if startIndex > endIndex {
        return 0
    }
    let start = text.index(text.startIndex, offsetBy: startIndex)
    let end = text.index(text.startIndex, offsetBy: endIndex)

    var matchCase = 0
    if text[start] == text[end] {
        matchCase = 2 + longestCommonSubSeq(startIndex + 1, endIndex - 1)
    }

    let takeStart = longestCommonSubSeq( startIndex, endIndex - 1)
    let takeEnd = longestCommonSubSeq( startIndex + 1, endIndex)

    let maxOfMisMatch = takeStart > takeEnd ? takeStart : takeEnd
    return matchCase > maxOfMisMatch ? matchCase : maxOfMisMatch
}

let longestSeq = longestCommonSubSeq(0, text.count - 1)
print(longestSeq)