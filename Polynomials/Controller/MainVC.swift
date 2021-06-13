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
        bisectionButton.layer.cornerRadius = bisectionButton.frame.size.height/2
        falesButton.layer.cornerRadius = falesButton.frame.size.height/2
        simpleFixedButton.layer.cornerRadius = simpleFixedButton.frame.size.height/2
        newtonButton.layer.cornerRadius = newtonButton.frame.size.height/2
        secantButton.layer.cornerRadius = secantButton.frame.size.height/2
        matrixButton.layer.cornerRadius = matrixButton.frame.size.height/2
        
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
