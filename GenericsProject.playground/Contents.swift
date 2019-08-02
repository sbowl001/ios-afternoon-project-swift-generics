import UIKit

struct CountedSet<Element: Hashable> {
    
//    private(set) var elements: [Element]
    private(set) var elements: [Element: Int] = [:]
    
    mutating func insert(_ element: Element){
//        self.elements[element]
        elements[element] = (elements[element] ?? 0) + 1
        
    }
    
    mutating func remove(_ element: Element)   {
    
       let e = self.elements[element] ?? 0
  
       
        if e > 0 {
            self.elements[element] = e - 1
        }
        
    }
 


    subscript(_ element: Element) -> Int {
        return self.elements[element] ?? 0
}
    mutating func count(_ element: Element) -> Int {
        if self.elements.isEmpty {
            return 0
        }
        else {
            return self.elements.count
        }
}
}

extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        for element in arrayLiteral {
            insert(element)
        }
    }   //can I get explanation on this?
}


enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
