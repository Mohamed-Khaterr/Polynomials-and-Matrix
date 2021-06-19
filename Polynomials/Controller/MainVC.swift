//
//  MainVC.swift
//  Polynomials
//
//  Created by Khater on 5/30/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var bisectionButton: UIButton!
    @IBOutlet weak var falesButton: UIButton!
    @IBOutlet weak var simpleFixedButton: UIButton!
    @IBOutlet weak var newtonButton: UIButton!
    @IBOutlet weak var secantButton: UIButton!
    @IBOutlet weak var matrixButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //make buttons with corners
        bisectionButton.cornerByTwo()
        falesButton.cornerByTwo()
        simpleFixedButton.cornerByTwo()
        newtonButton.cornerByTwo()
        secantButton.cornerByTwo()
        matrixButton.cornerByTwo()
        
    }
    
    @IBAction func bisectionPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBisection", sender: self)
    }
    
    @IBAction func falsePositinPressed(_ sender: UIButton) {
        //goToFalsePosition
        self.performSegue(withIdentifier: "goToFalsePosition", sender: self)
    }
    
    @IBAction func simpleFixedPointPressed(_ sender: UIButton) {
        //goToSimple
        self.performSegue(withIdentifier: "goToSimple", sender: self)
    }
    
    @IBAction func newtonPressed(_ sender: UIButton) {
        //goToNewton
        self.performSegue(withIdentifier: "goToNewton", sender: self)
    }
    
    @IBAction func secantPressed(_ sender: UIButton) {
        //goToSecant
        self.performSegue(withIdentifier: "goToSecant", sender: self)
    }
    
    @IBAction func matrixPressed(_ sender: UIButton) {
        //goToMatrix
        self.performSegue(withIdentifier: "goToMatrix", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
