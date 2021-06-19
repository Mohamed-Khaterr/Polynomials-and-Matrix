//
//  MatrixVC.swift
//  Polynomials
//
//  Created by Khater on 6/1/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class MatrixVC: UIViewController {
    
    @IBOutlet weak var gaussButton: UIButton!
    @IBOutlet weak var luButton: UIButton!
    @IBOutlet weak var cramerButton: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        gaussButton.cornerByTwo()
        luButton.cornerByTwo()
        cramerButton.cornerByTwo()
    }
    
    @IBAction func buttonPresses(_ sender: UIButton) {
        
        switch sender.currentTitle {
            
        case "Gauss":
            self.performSegue(withIdentifier: "goToGauss", sender: self)
            
        case "LU":
            self.performSegue(withIdentifier: "goToLU", sender: self)
            
        case "Cramer's":
            self.performSegue(withIdentifier: "goToCramer", sender: self)
            
        default:
            print("Error")
        }
    }
}
