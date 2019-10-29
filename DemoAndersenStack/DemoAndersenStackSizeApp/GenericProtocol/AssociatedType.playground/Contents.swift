import UIKit

protocol Screen {
    associatedtype ItemType: Item
    associatedtype ChildScreen: Screen where ChildScreen.ItemType == ItemType
    var items: [ItemType] { get set }
    var childScreens: [ChildScreen] { get set }
}

protocol Item {
    init(filename: String)
}

class MainScreen<T: Item>: Screen {
    var items = [T]()
    var childScreen = [CategoryScreen<T>]()
}

class CategoryScreen<T: Item>: Screen {
    var items = [T]()
    var childScreens = [DetailScreen<T>]()
}

class DetailScreen<T: Item>: Screen {
    var items: [T]()
    var childScreen = [DetailScreen<T>]()
}

struct Movie: Item {
    var filePrivate: String
}

struct Song: Item {
    var filename: String
}
