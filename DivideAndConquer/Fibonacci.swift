func fibonacci(_ number: Int) -> Int {
    if number <= 1 {
        return number
    }
    return fibonacci(number - 1) + fibonacci(number - 2)
}

let number = fibonacci(9)
print(number)



