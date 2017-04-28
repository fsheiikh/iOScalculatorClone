//
//  ViewController.swift
//  09_CalculatorClone
//
//  Created by User on 4/27/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTotal: UILabel!
    var numTotal : Double = 0
    var tempTotal : Double = 0
    var afterCalc: Double = 0
    var method : String = ""
    
    
    @IBAction func numClick(sender: AnyObject) {
        print(sender.tag)
        
        (sender.tag < 10) ? (lblTotal.text?.appendContentsOf(String(sender.tag))) :
            ((sender.tag == 10) ? (lblTotal.text = "") :
                (lblTotal.text?.appendContentsOf(".")))
        
        numTotal = (lblTotal.text! as NSString).doubleValue
        
        print(numTotal)
    }
    
    @IBAction func btnCalc(sender: AnyObject) {
        tempTotal = numTotal
        lblTotal.text = ""
        numTotal = 0
        
        if(sender.tag == 13) {method = "Divide"}
        else if(sender.tag == 14) {method = "Multiply"}
        else if(sender.tag == 15) {method = "Subtract"}
        else if(sender.tag == 16) {method = "Add"}
        
    }
    
    @IBAction func btnEquals(sender: UIButton) {
        switch method {
        case "Add":
            afterCalc = tempTotal + numTotal
        case "Subtract":
            afterCalc = tempTotal - numTotal
        case "Multiply":
            afterCalc = tempTotal * numTotal
        case "Divide":
            afterCalc = tempTotal / numTotal
        default:
            afterCalc = tempTotal - numTotal
        }
        
        lblTotal.text = String(afterCalc)
    }
    
    @IBAction func btnManipulate(sender: AnyObject) {
        if(sender.tag == 10)
        {
            numTotal = 0;
            tempTotal = 0;
            afterCalc = 0
            lblTotal.text = ""
        }
        else if(sender.tag == 11)
        {
            if(method == "")
            {
                numTotal = numTotal * -1
                lblTotal.text = String(numTotal)
            }
            else
            {
                tempTotal = tempTotal * -1
                lblTotal.text = String(tempTotal)

            }
        }
        else if(sender.tag == 12)
        {
            if(method == "")
            {
                numTotal = numTotal / 100.00
                lblTotal.text = String(numTotal)
            }
            else
            {
                tempTotal = tempTotal / 100.00
                lblTotal.text = String(tempTotal)
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTotal.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

