

//
//  TapButton.swift
//  DemoAndersenStackSizeApp
//
//  Created by admin on 29.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class TapButton: UIButton {

//    /// Толщина границы
//        @IBInspectable var borderWidth: CGFloat {
//            set { layer.borderWidth = newValue }
//            get { return layer.borderWidth }
//        }
//    ///Цвет границы
//        @IBInspectable var borderColor: UIColor? {
//             get {
//                return UIColor(cgColor: self.layer.borderColor!)
//             }
//             set {
//                self.layer.borderColor = newValue?.cgColor
//             }
//        }
//        
//        /// Радиус границы
//        @IBInspectable var cornerRadius: CGFloat {
//            set { layer.cornerRadius = newValue }
//            get { return layer.cornerRadius  }
//        }
    
    @IBInspectable var cornerRadius: Double {
         get {
           return Double(self.layer.cornerRadius)
         }set {
           self.layer.cornerRadius = CGFloat(newValue)
         }
    }
    @IBInspectable var borderWidth: Double {
          get {
            return Double(self.layer.borderWidth)
          }
          set {
           self.layer.borderWidth = CGFloat(newValue)
          }
    }
    @IBInspectable var borderColor: UIColor? {
         get {
            return UIColor(cgColor: self.layer.borderColor!)
         }
         set {
            self.layer.borderColor = newValue?.cgColor
         }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
           return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
           self.layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowOpacity: Float {
        get {
           return self.layer.shadowOpacity
        }
        set {
           self.layer.shadowOpacity = newValue
       }
    }
    
}

extension CGColor {
    private var UIColor: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}
