//
//  ViewController.swift
//  DemoAndersenStackSizeApp
//
//  Created by admin on 28.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Vertical
    @IBOutlet weak var v1Button: UIButton!
    @IBOutlet weak var v2Button: UIButton!
    @IBOutlet weak var v3Button: UIButton!
    @IBOutlet weak var v4Button: UIButton!
    @IBOutlet weak var v5Button: UIButton!
    
    //Horizontal
    @IBOutlet weak var H1Button: UIButton!
    @IBOutlet weak var H2Button: UIButton!
    @IBOutlet weak var H3Button: UIButton!
    @IBOutlet weak var H4Button: UIButton!
    @IBOutlet weak var H5Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Vertical
    @IBAction func didTapV1Button(_ sender: Any) {
        v1Button.isHidden = true
    }
    
    @IBAction func didTapV2Button(_ sender: Any) {
        v2Button.isHidden = true
    }
    
    @IBAction func didTapV3Button(_ sender: Any) {
        v3Button.isHidden = true
    }
    
    @IBAction func didTapV4Button(_ sender: Any) {
        v4Button.isHidden = true
    }
    
    @IBAction func didTapV5Button(_ sender: Any) {
        v5Button.isHidden = true
    }
    
    //Horizontal
    @IBAction func didTapH1Button(_ sender: Any) {
        H1Button.isHidden = true
    }
    
    @IBAction func didTapH2Button(_ sender: Any) {
        H2Button.isHidden = true
    }
    
    @IBAction func didTapH3Button(_ sender: Any) {
        H3Button.isHidden = true
    }
    
    @IBAction func didTapH4Button(_ sender: Any) {
        H4Button.isHidden = true
    }
    
    @IBAction func didTapH5Button(_ sender: Any) {
        H5Button.isHidden = true
    }

}

