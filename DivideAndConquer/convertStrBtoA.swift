/*  WAP to calculate minimum steps required to convert String B to string A using only insertion, deletion or replacing.
*/
let strA = "table"
let strB = "tcble"

func calcMinOperation(_ currentIndexOfA: Int, _ currentIndexOfB: Int) -> Int {
    if currentIndexOfA > (strA.count - 1) {
        if currentIndexOfB <= (strB.count - 1) {
            return 1 + calcMinOperation(currentIndexOfA ,currentIndexOfB + 1)
        } else {
            return 0
        }
    }

    if currentIndexOfB > (strB.count - 1) {
        return 1 + calcMinOperation(currentIndexOfA + 1, currentIndexOfB)
    }
    let strAIndex = strA.index(strA.startIndex, offsetBy: currentIndexOfA)
    let strBIndex = strB.index(strB.startIndex, offsetBy: currentIndexOfB)
    
    if strA[strAIndex] == strB[strBIndex] {
        return calcMinOperation(currentIndexOfA + 1, currentIndexOfB + 1)
    } else {
        let insertOperation = 1 + calcMinOperation(currentIndexOfA + 1, currentIndexOfB )
        let replaceOperation = 1 + calcMinOperation(currentIndexOfA + 1, currentIndexOfB + 1)
        let deleteOperation = 1 + calcMinOperation(currentIndexOfA , currentIndexOfB + 1)

        if insertOperation < replaceOperation {
            if insertOperation < deleteOperation {
                return insertOperation
            } else {
                return deleteOperation
            }
        } else {
            if replaceOperation < deleteOperation {
                return replaceOperation
            } else {
                return deleteOperation
            }
        }
    }
}

let operations = calcMinOperation(0,0)
print(operations)
