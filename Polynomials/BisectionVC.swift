//
//  ViewController.swift
//  Polynomials
//
//  Created by Khater on 5/5/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class BisectionVC: UIViewController {

    //Text Field
    @IBOutlet weak var functionTextField: UITextField!
    @IBOutlet weak var xlTextField: UITextField!
    @IBOutlet weak var xuTextField: UITextField!
    @IBOutlet weak var epsTextField: UITextField!
    @IBOutlet weak var iterationTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    //Buttons
    @IBOutlet weak var cleatButton: UIButton!
    @IBOutlet weak var powButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var bigXButton: UIButton!
    
    let poly = Polynomials()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //make buttons with corners
        cleatButton.cornerByThree()
        powButton.cornerByThree()
        calculateButton.cornerByThree()
        plusButton.cornerByThree()
        multiplicationButton.cornerByThree()
        bigXButton.cornerByThree()
        
        //This to Add dot to number pad
        functionTextField.keyboardType = .decimalPad
        xlTextField.keyboardType = .decimalPad
        xuTextField.keyboardType = .decimalPad
        epsTextField.keyboardType = .decimalPad
    }
    
    
    //This func To Disaper the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        functionTextField.resignFirstResponder()
        xlTextField.resignFirstResponder()
        xuTextField.resignFirstResponder()
        epsTextField.resignFirstResponder()
        iterationTextField.resignFirstResponder()
    }

    @IBAction func buttonsPressed(_ sender: UIButton) {
        if let safeSender = sender.currentTitle{
            switch safeSender {
                case "X":
                    functionTextField.text! += "X"
                case "+":
                    functionTextField.text! += " + "
                case "-":
                    functionTextField.text! += " - "
                case "Pow":
                    functionTextField.text! += "^"
                default:
                    print("Erorr!")
            }
        }
    }
    
    @IBAction func clearButtonPressd(_ sender: UIButton) {
        functionTextField.text = ""
        xlTextField.text = ""
        xuTextField.text = ""
        epsTextField.text = ""
        iterationTextField.text = ""
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let xl = Double(xlTextField.text!)
        let xu = Double(xuTextField.text!)
        let iter = Int(iterationTextField.text!)
        let eps = Double(epsTextField.text!)
        
        //func = X^4 - 8X^3 - 35X^2 + 450X - 1001
        
        if let fun = functionTextField.text {
            if poly.check(fun: fun, xl: xl, xu: xu, iter: iter, eps: eps){
                if eps != nil{
                    poly.bisection(xl: xl!, xu: xu!, eps: eps!, fun: fun)
                }else{
                    poly.bisectionWithIteration(xl: xl!, xu: xu!, iter: iter!, fun: fun)
                }
                self.performSegue(withIdentifier: "goToResult", sender: self)
                poly.setReset()
                
            }else{
                if fun == ""{
                    functionTextField.placeholder = "Enter function"
                    functionTextField.wiggleTheButton()
                }
                if xl == nil {
                    xlTextField.placeholder = "Enter XL"
                    xlTextField.wiggleTheButton()
                }
                if xu == nil{
                    xuTextField.placeholder = "Enter XU"
                    xuTextField.wiggleTheButton()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result += poly.getResult()
        }
    }
    
}

