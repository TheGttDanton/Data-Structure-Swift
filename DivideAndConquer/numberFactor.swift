// Count of different ways to express N as the sum of 1, 3 and 4

func numberOfWays(_ number: Int) -> Int {
    if number == 0 || number == 1 || number == 2 {
        return 1
    } else if number == 3 {
        return 2 // {1,1,1}, {3}
    } else {
        let subtract1 = numberOfWays(number - 1)
        let subtract3 = numberOfWays(number - 3)
        let subtract4 = numberOfWays(number - 4)
        return subtract1 + subtract3 + subtract4
    }
}

let ways = numberOfWays(5)
print(ways)
