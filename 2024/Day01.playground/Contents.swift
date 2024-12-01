import Foundation

func parseInput(_ input: String) -> (left: [Int], right: [Int]) {
    let lines = input.split(separator: "\n")
    var leftList: [Int] = []
    var rightList: [Int] = []
    
    for line in lines {
        let numbers = line.split(separator: " ").compactMap { Int($0) }
        if numbers.count == 2 {
            leftList.append(numbers[0])
            rightList.append(numbers[1])
        }
    }
    
    return (leftList, rightList)
}

func calculateDistance(_ input: String) -> Int {
    let lists = parseInput(input)
    var leftList = lists.left
    var rightList = lists.right
    
    leftList.sort()
    rightList.sort()
    
    print("\nSorted lists:")
    print("Left:  \(leftList)")
    print("Right: \(rightList)")
    
    var totalDistance = 0
    print("Calculating distances between pairs:")
    
    for (index, (left, right)) in zip(leftList, rightList).enumerated() {
        let distance = abs(left - right)
        totalDistance += distance
        print("Pair \(index + 1): \(left) vs \(right) = distance of \(distance)")
    }
    
    print("\nTotal distance: \(totalDistance)")
    return totalDistance
}


func similarityScore(_ input: String) -> Int {
    let columns = parseInput(input)
    
    return columns.left.reduce(0) { partialResult, number in
        let occuranceCount = columns.right.filter { $0 == number }.count
        
        print("\nTotal similarity: \(partialResult + (occuranceCount * number))")
        return partialResult + (occuranceCount * number)
    }
}

var exampleInput = """
"""

let result = calculateDistance(exampleInput)
let result2 = similarityScore(exampleInput)
