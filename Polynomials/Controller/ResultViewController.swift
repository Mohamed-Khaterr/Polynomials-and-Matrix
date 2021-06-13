//
//  ResultViewController.swift
//  Polynomials
//
//  Created by Khater on 5/12/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let poly = Polynomials()
    var result:String = "\n\n\n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = backButton.frame.size.height/2
        resultLabel.text = result
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        resultLabel.text = ""
        poly.setReset()
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
