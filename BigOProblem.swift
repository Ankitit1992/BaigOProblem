func bruteForce(_ A: [Int], _ B: [Int]) {
    for val in A {
        for va in B {
            if val == va {
                print("Same value fine \(val)")
            }
        }
    }
}


bruteForce([4,6,7], [3,6,8])

// Brute force Naive O(2n)

func bruteForce2N(_ A: [Int], _ B: [Int]) {
    var hashA = [Int: Bool]()
    for val in A {
        hashA[val] = true
    }
    
    for val in B {
        if hashA[val] == true {
            print("Find value \(val)")
        }
    }
}

bruteForce2N([4,8,7], [3,6,8])


func kRotationArray(_ array: inout [Int], _ k: Int) -> [Int] {
    if k < 1 {
        return array
    }
    let temp = array.last ?? 0
    array.removeLast()
    array.insert(temp, at: 0)
    kRotationArray(&array, k-1)
    return array
}

func KRotationWithArray(_ array: [Int], k: Int) -> [Int] {
    var newArr = array
    
    for _ in 1...k {
        
        let temp = newArr.last ?? 0
        newArr.removeLast()
        newArr.insert(temp, at: 0)
    }
    return newArr
}

func KrotationSolutionThrees(_ array: [Int], k: Int) -> [Int] {
    var resultArray = array
    for _ in 1...k {
        resultArray = arrShift(resultArray)
    }
    return resultArray
}

func arrShift(_ array: [Int]) -> [Int] {
    var newarray = Array(repeating: 0, count: array.count)
    newarray.reserveCapacity(array.capacity)
    
    for i in 0..<array.count - 1 {
        newarray[i+1] = array[i]
    }
    newarray[0] = array.last ?? 0
    return newarray
}

var array = [3, 8, 9, 7, 6]
//print(kRotationArray(&array, 3))// [9, 7, 6, 3, 8]
print(KRotationWithArray(array, k: 3))
print(KrotationSolutionThrees(array, k: 3))


// Phone Format
func phoneFormat(_ string: String) -> String {
    let noSpace = string.replacingOccurrences(of: " ", with: "")
    let dashString = noSpace.replacingOccurrences(of: "-", with: "")
    var result = ""
    var valu = ""
    for v in dashString {
         valu.append(v)
        result.append(v)
        if valu.count % 3 == 0 {
             valu = ""
            result.append("-")
        }
    }
    
    if result.last == "-" {
        result.removeLast()
    }
    
    var char = Array(result)
    let secondLastCount = char.count - 2
    
    if char[secondLastCount] == "-" {
        char[secondLastCount] = char[secondLastCount - 1]
        char[secondLastCount - 1] = "-"
    }
    
    
    return String(char)
}

print(phoneFormat("123456784"))
print(phoneFormat("555372654")  )         // 555-372-654
print(phoneFormat("0 - 22 1985--324"))
phoneFormat("01")                          // 01
phoneFormat("012")                         // 012
phoneFormat("0123")                        // 01-23
phoneFormat("0123       444")              // 012-34-44
phoneFormat("------0123       444")


func foundContact(_ a: [String], _ b: [String], _ p: String) -> String {
    var result = [String]()
    for i in 0..<b.count {
        if b[i].contains(p) {
            result.append(a[i])
        }
    }
    if result.isEmpty {
        return "no contact found"
    } else if result.count == 1 {
        return result.first ?? ""
    }
    return result.sorted().first ?? ""
}
let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"
print(foundContact(["sander", "amy", "ann"], ["12345", "23456", "123"], "1"))  // ann
print(foundContact(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112"))   // NO CONTACT

// edge cases
print(foundContact([String](), [String](), ""))
print(foundContact(A, B, ""))

print(foundContact(A, B, P))
