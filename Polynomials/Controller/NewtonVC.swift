//
//  NewtonVC.swift
//  Polynomials
//
//  Created by Khater on 5/31/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class NewtonVC: UIViewController {

    @IBOutlet weak var fxTextField: UITextField!
    @IBOutlet weak var fDashTextField: UITextField!
    @IBOutlet weak var xoTextField: UITextField!
    @IBOutlet weak var epsTextField: UITextField!
    @IBOutlet weak var iterTextField: UITextField!
    
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
        clearButton.layer.cornerRadius = clearButton.frame.size.height/3
        powButton.layer.cornerRadius = powButton.frame.size.height/3
        calculateButton.layer.cornerRadius = calculateButton.frame.size.height/3
        plusButton.layer.cornerRadius = plusButton.frame.size.height/3
        minusButton.layer.cornerRadius = minusButton.frame.size.height/3
        bigXButton.layer.cornerRadius = bigXButton.frame.size.height/3
    }
    
    //This func To Disaper the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fxTextField.resignFirstResponder()
        fDashTextField.resignFirstResponder()
        xoTextField.resignFirstResponder()
        epsTextField.resignFirstResponder()
        iterTextField.resignFirstResponder()
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        fxTextField.text = ""
        fDashTextField.text = ""
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
        //- 0.9X^2 + 1.7X + 2.5
        //- 1.8X + 1.7
        
        let iter = Int(iterTextField.text!)
        let eps = Double(epsTextField.text!)
        let xo = Double(xoTextField.text!)
        
        
        if let fun = fxTextField.text {
            if let fDash = fDashTextField.text{
                if xo != nil{
                    if eps != nil {
                        poly.newton(x: xo!, eps: eps!, funDash: " \(fDash) ", fun: " \(fun) ")
                        self.performSegue(withIdentifier: "goToResult", sender: self)
                        poly.setReset()
                    }else if iter != nil{
                        poly.newtonWithIter(x: xo!, iter: iter!, funDash: " \(fDash) ", fun: " \(fun) ")
                        self.performSegue(withIdentifier: "goToResult", sender: self)
                        poly.setReset()
                    }
                }
            }
        }
        if fxTextField.text == ""{
            fxTextField.placeholder = "Enter F(x)"
            fxTextField.wiggleTheButton()
        }
        if fDashTextField.text == ""{
            fDashTextField.placeholder = "Enter FDash"
            fDashTextField.wiggleTheButton()
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
