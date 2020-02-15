// There are n houses build in a line, each of which contains some value in it. A thief is going to steal
//  the maximal value of these houses, but he can’t steal in two adjacent houses. What is the maximum stolen value.


let housesWithMoneys = [20,5,1,13,6,11,40]

func maxSumStolen(_ currentIndex: Int) -> Int {
    if currentIndex > housesWithMoneys.count - 1 {
        return 0
    }

    let currentIndexTaken = housesWithMoneys[currentIndex] + maxSumStolen(currentIndex + 2)
    let currentIndexNotTaken = maxSumStolen(currentIndex + 1)
    if currentIndexTaken > currentIndexNotTaken {
        return currentIndexTaken
    } else {
        return currentIndexNotTaken
    }
}

let maxMoney = maxSumStolen(0)
print(maxMoney)
