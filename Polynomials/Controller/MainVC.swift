//
//  MainVC.swift
//  Polynomials
//
//  Created by Khater on 5/30/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var welcomeLable: UILabel!
    @IBOutlet weak var bisectionButton: UIButton!
    @IBOutlet weak var falesButton: UIButton!
    @IBOutlet weak var simpleFixedButton: UIButton!
    @IBOutlet weak var newtonButton: UIButton!
    @IBOutlet weak var secantButton: UIButton!
    @IBOutlet weak var matrixButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLable.text = ""
        var character = 0.0
        let title = "Welcome"
        for element in title{
            Timer.scheduledTimer(withTimeInterval: 0.1 * character, repeats: false) { (timer) in
                self.welcomeLable.text?.append(element)
            }
            character += 1
        }

        //make buttons with corners
        bisectionButton.cornerByTwo()
        falesButton.cornerByTwo()
        simpleFixedButton.cornerByTwo()
        newtonButton.cornerByTwo()
        secantButton.cornerByTwo()
        matrixButton.cornerByTwo()
        
    }
    
    @IBAction func bisectionPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: Constant.bisection, sender: self)
    }
    
    @IBAction func falsePositinPressed(_ sender: UIButton) {
        //goToFalsePosition
        self.performSegue(withIdentifier: Constant.falsePosition, sender: self)
    }
    
    @IBAction func simpleFixedPointPressed(_ sender: UIButton) {
        //goToSimple
        self.performSegue(withIdentifier: Constant.simple, sender: self)
    }
    
    @IBAction func newtonPressed(_ sender: UIButton) {
        //goToNewton
        self.performSegue(withIdentifier: Constant.newton, sender: self)
    }
    
    @IBAction func secantPressed(_ sender: UIButton) {
        //goToSecant
        self.performSegue(withIdentifier: Constant.secant, sender: self)
    }
    
    @IBAction func matrixPressed(_ sender: UIButton) {
        //goToMatrix
        self.performSegue(withIdentifier: Constant.matrix, sender: self)
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
