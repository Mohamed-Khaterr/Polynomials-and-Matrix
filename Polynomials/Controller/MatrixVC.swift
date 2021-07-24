//
//  MatrixVC.swift
//  Polynomials
//
//  Created by Khater on 6/1/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class MatrixVC: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var gaussButton: UIButton!
    @IBOutlet weak var luButton: UIButton!
    @IBOutlet weak var cramerButton: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = ""
        var character = 0.0
        let title = "Welcom To Matrix"
        for element in title{
            Timer.scheduledTimer(withTimeInterval: 0.1 * character, repeats: false) { (timer) in
                self.welcomeLabel.text?.append(element)
            }
            character += 1
        }

        gaussButton.cornerByTwo()
        luButton.cornerByTwo()
        cramerButton.cornerByTwo()
    }
    
    @IBAction func buttonPresses(_ sender: UIButton) {
        
        switch sender.currentTitle {
            
        case "Gauss":
            self.performSegue(withIdentifier: Constant.Matrix.gauss, sender: self)
            
        case "LU":
            self.performSegue(withIdentifier: Constant.Matrix.lu, sender: self)
            
        case "Cramer's":
            self.performSegue(withIdentifier: Constant.Matrix.cramer, sender: self)
            
        default:
            print("Error")
        }
    }
}
