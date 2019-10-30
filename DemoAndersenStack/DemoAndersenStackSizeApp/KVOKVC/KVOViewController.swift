//
//  KVOViewController.swift
//  DemoAndersenStackSizeApp
//
//  Created by admin on 30.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class ChangeColorModel: NSObject {
    @objc dynamic var color: UIColor?
    
    init(color: UIColor) {
        super.init()
        self.color = color
    }
}

private var myContext = ChangeColorModel(color: UIColor())
class ChangeColorManager: NSObject {
    var changeColor: ChangeColorModel
    
    init(changeColor: ChangeColorModel) {
        self.changeColor = changeColor
        
        super.init()
        self.changeColor.addObserver(self, forKeyPath: #keyPath(ChangeColorModel.color), options: .new, context: &myContext)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &myContext {
            print("the value has change")
        }
    }
}

class KVOViewController: UIViewController {

    @IBOutlet weak var outsideView: UIView!
    
    var newColor = ChangeColorModel(color: UIColor())
    var manager: ChangeColorManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = ChangeColorManager(changeColor: newColor)
    }
    
    @IBAction func didTapChangeBackgroundColor(_ sender: Any) {
        newColor.color = .red
        outsideView.backgroundColor = newColor.color
    }
}
