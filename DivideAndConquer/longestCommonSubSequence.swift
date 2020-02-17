let firstString = "AGGTAB"
let secondString = "GXTXAYB"

func longestCommonSequence(_ indexFirst: Int, _ indexSecond: Int) -> Int {

    if indexFirst > (firstString.count - 1) || indexSecond > (secondString.count - 1) {
        return 0
    }

    let firstStrIndex = firstString.index(firstString.startIndex, offsetBy: indexFirst)
    let secondStrIndex = secondString.index(secondString.startIndex, offsetBy: indexSecond)

    var matchCaseCount = 0
    if firstString[firstStrIndex] == secondString[secondStrIndex] {
        matchCaseCount = 1 + longestCommonSequence(indexFirst + 1, indexSecond + 1)
    }

    let unMatchTakeStrF = 0 + longestCommonSequence(indexFirst , indexSecond + 1)
    let unMatchTakeStrS = 0 + longestCommonSequence(indexFirst + 1, indexSecond )
    
    if unMatchTakeStrF > unMatchTakeStrS {
        if unMatchTakeStrF > matchCaseCount {
            return unMatchTakeStrF
        } else {
            return matchCaseCount
        }
    } else {
        if unMatchTakeStrS > matchCaseCount {
            return unMatchTakeStrS
        } else {
            return matchCaseCount
        }
    }
}

let longestCount = longestCommonSequence(0,0)
print(longestCount)
