import UIKit
import CoreData

protocol Persistable {
    associatedtype Entity: NSManagedObject
    
    func create(e: Entity)
    
    func read() -> [Entity]
    
    func update(e:  Entity)
    
    func delete(e: Entity)
}

//struct TaskDataSource: Persistable {
////    func create(e: TaskMO) {
////
////    }
////
////    func read() -> [TaskMO] {
////        return []
////    }
////
////    func update(e: TaskMO) {
////
////    }
////
////    func delete(e: TaskMO) {
////
////    }
//}

protocol Ingradient {
    
    var ingradient: String { get set }
    init()
}

struct Expresso: Ingradient {
    
    var ingradient: String
    
    init() {
        ingradient = "☕️"
    }
}

struct Milk: Ingradient {
    
    var ingradient: String
    
    init() {
        ingradient = "🥛"
    }
}

struct Soy: Ingradient {
    
    var ingradient: String
    
    init() {
        ingradient = "🌱"
    }
}

protocol Drinkable {
    associatedtype PrimaryIngredient: Ingradient
    associatedtype SecondaryIngradient: Ingradient
    
    var ingredients: [Any] { get set }
    
    mutating func fill()
    
    func provideMilk() -> SecondaryIngradient
    
    func provideCoffee() -> PrimaryIngredient
}

func provideCoffee() -> Expresso {
    return Expresso()
}

extension Drinkable {
    func provideMilk() -> SecondaryIngradient {
        return SecondaryIngradient()
    }
    
    func provideCoffee() -> Expresso {
        return Expresso()
    }
    
    mutating func fill() {
        ingredients.append([provideMilk(), provideCoffee()])
    }
}

struct LatteMachiato: Drinkable {
    var ingredients: [Any] = []
    typealias SecondaryIngradient = Milk
}

struct SoyLatte: Drinkable {
    var ingredients: [Any] = []
    typealias SecondaryIngradient = Soy
}

class CoffeeMachine {
    func makeCoffee() {
        var latteMachiato = LatteMachiato()
        latteMachiato.fill()
        
        print("Latte Mqcchiato: \(latteMachiato.ingredients)")
        
        var soyLatte = SoyLatte()
        soyLatte.fill()
        
        print("Soy Latte: \(soyLatte.ingredients)")
    }
}

let wayToExpensiveCoffeeMachine = CoffeeMachine()
wayToExpensiveCoffeeMachine.makeCoffee()
