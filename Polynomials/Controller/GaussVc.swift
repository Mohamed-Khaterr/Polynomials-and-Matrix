//
//  GaussVc.swift
//  Polynomials
//
//  Created by Khater on 6/1/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class GaussVc: UIViewController {
    
    @IBOutlet weak var a11TextField: UITextField!
    @IBOutlet weak var a12TextField: UITextField!
    @IBOutlet weak var a13TextField: UITextField!
    @IBOutlet weak var a14TextField: UITextField!
    @IBOutlet weak var a21TextField: UITextField!
    @IBOutlet weak var a22TextField: UITextField!
    @IBOutlet weak var a23TextField: UITextField!
    @IBOutlet weak var a24TextField: UITextField!
    @IBOutlet weak var a31TextField: UITextField!
    @IBOutlet weak var a32TextField: UITextField!
    @IBOutlet weak var a33TextField: UITextField!
    @IBOutlet weak var a34TextField: UITextField!
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    let matrix = Matrix()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.cornerByTwo()
    }
    
    //This func To Disaper the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        a11TextField.resignFirstResponder()
        a12TextField.resignFirstResponder()
        a13TextField.resignFirstResponder()
        a14TextField.resignFirstResponder()
        a21TextField.resignFirstResponder()
        a22TextField.resignFirstResponder()
        a23TextField.resignFirstResponder()
        a24TextField.resignFirstResponder()
        a31TextField.resignFirstResponder()
        a32TextField.resignFirstResponder()
        a33TextField.resignFirstResponder()
        a34TextField.resignFirstResponder()
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let a11 = Double(a11TextField.text!)
        let a12 = Double(a12TextField.text!)
        let a13 = Double(a13TextField.text!)
        let a14 = Double(a14TextField.text!)
        let a21 = Double(a21TextField.text!)
        let a22 = Double(a22TextField.text!)
        let a23 = Double(a23TextField.text!)
        let a24 = Double(a24TextField.text!)
        let a31 = Double(a31TextField.text!)
        let a32 = Double(a32TextField.text!)
        let a33 = Double(a33TextField.text!)
        let a34 = Double(a34TextField.text!)
        
        if matrix.check(a11: a11, a12: a12, a13: a13, a14: a14, a21: a21, a22: a22, a23: a23, a24: a24, a31: a31, a32: a32, a33: a33, a34: a34){
            
            matrix.gauss(a11: a11!, a12: a12!, a13: a13!, a14: a14!, a21: a21!, a22: a22!, a23: a23!, a24: a24!, a31: a31!, a32: a32!, a33: a33!, a34: a34!)
            
            self.performSegue(withIdentifier: Constant.result, sender: self)
            matrix.setReset()
            
        }
        
        if a11 == nil {
            a11TextField.wiggleTheButton()
        }
        if a12 == nil {
            a12TextField.wiggleTheButton()
        }
        if a13 == nil {
            a13TextField.wiggleTheButton()
        }
        if a14 == nil {
            a14TextField.wiggleTheButton()
        }
        if a21 == nil {
            a21TextField.wiggleTheButton()
        }
        if a22 == nil {
            a22TextField.wiggleTheButton()
        }
        if a23 == nil {
            a23TextField.wiggleTheButton()
        }
        if a24 == nil {
            a24TextField.wiggleTheButton()
        }
        if a31 == nil {
            a31TextField.wiggleTheButton()
        }
        if a32 == nil {
            a32TextField.wiggleTheButton()
        }
        if a33 == nil {
            a33TextField.wiggleTheButton()
        }
        if a34 == nil {
            a34TextField.wiggleTheButton()
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.result{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result += matrix.getResult()
        }
    }

}
