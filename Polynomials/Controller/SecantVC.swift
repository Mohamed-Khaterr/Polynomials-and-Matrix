//
//  SecantVC.swift
//  Polynomials
//
//  Created by Khater on 6/1/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class SecantVC: UIViewController {

    @IBOutlet weak var fxTextField: UITextField!
    @IBOutlet weak var xoTextField: UITextField!
    @IBOutlet weak var xMinusTextField: UITextField!
    @IBOutlet weak var iterTextField: UITextField!
    @IBOutlet weak var epsTextField: UITextField!
    
    //Buttons
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var powButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var bigXButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    
    let poly = Polynomials()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //make buttons with corners
        clearButton.cornerByThree()
        powButton.cornerByThree()
        calculateButton.cornerByThree()
        plusButton.cornerByThree()
        minusButton.cornerByThree()
        bigXButton.cornerByThree()
    }
    
    //This func To Disaper the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fxTextField.resignFirstResponder()
        xMinusTextField.resignFirstResponder()
        xoTextField.resignFirstResponder()
        epsTextField.resignFirstResponder()
        iterTextField.resignFirstResponder()
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        fxTextField.text = ""
        xMinusTextField.text = ""
        xoTextField.text = ""
        epsTextField.text = ""
        iterTextField.text = ""
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let safeSender = sender.currentTitle{
            switch safeSender {
                case "X":
                    fxTextField.text! += "X"
                case "+":
                    fxTextField.text! += " + "
                case "-":
                    fxTextField.text! += " - "
                case "Pow":
                    fxTextField.text! += "^"
                default:
                    print("Erorr!")
            }
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // 2X^3 - 11.7X^2 + 17.7X + 5
        // 0.95X^3 - 5.9X^2 + 10.9X - 6
        
        let iter = Int(iterTextField.text!)
        let eps = Double(epsTextField.text!)
        let xo = Double(xoTextField.text!)
        let xMinus = Double(xMinusTextField.text!)
        
        
        if let fun = fxTextField.text {
            if xo != nil && xMinus != nil{
                if eps != nil {
                    poly.secant(xo: xo!, xMinus: xMinus!, eps: eps!, fun: fun)
                    self.performSegue(withIdentifier: "goToResult", sender: self)
                    poly.setReset()
                }else if iter != nil{
                    poly.secantWithIter(xo: xo!, xMinus: xMinus!, iter: iter!, fun: fun)
                    self.performSegue(withIdentifier: "goToResult", sender: self)
                    poly.setReset()
                }
            }
        }
        if fxTextField.text == ""{
            fxTextField.placeholder = "Enter ƒ(x)"
            fxTextField.wiggleTheButton()
        }
        if xMinusTextField.text == ""{
            xMinusTextField.placeholder = "Enter X-1"
            xMinusTextField.wiggleTheButton()
        }
        if xo == nil{
            xoTextField.placeholder = "Enter Xo"
            xoTextField.wiggleTheButton()
        }
        if eps == nil && iter == nil{
            epsTextField.placeholder = "Enter eps"
            epsTextField.wiggleTheButton()
            iterTextField.placeholder = "Enter iter"
            iterTextField.wiggleTheButton()
        }
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result += poly.getResult()
        }
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
