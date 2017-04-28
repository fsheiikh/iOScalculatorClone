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
        
        //checks to see if it is a number and appends the number to the main label
        (sender.tag < 10) ? (lblTotal.text?.appendContentsOf(String(sender.tag))) :
            ((sender.tag == 10) ? (lblTotal.text = "") :
                (lblTotal.text?.appendContentsOf(".")))
        
        //keep track of number entered in numTotal
        numTotal = (lblTotal.text! as NSString).doubleValue
        
        print(numTotal)
    }
    
    @IBAction func btnCalc(sender: AnyObject) {
        tempTotal = numTotal //save numTotal and reset it to get second number for computing
        lblTotal.text = ""
        numTotal = 0
        
        //get the action needed to do and save it in a amethod variable
        if(sender.tag == 13) {method = "Divide"}
        else if(sender.tag == 14) {method = "Multiply"}
        else if(sender.tag == 15) {method = "Subtract"}
        else if(sender.tag == 16) {method = "Add"}
        
    }
    
    @IBAction func btnEquals(sender: UIButton) {
        //determine action to take based n method variable
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
        if(sender.tag == 10) //if clicked C or clear
        {
            numTotal = 0;
            tempTotal = 0;
            afterCalc = 0
            lblTotal.text = ""
        }
        else if(sender.tag == 11) //if clicked negative/positive
        {

            numTotal = numTotal * -1
            lblTotal.text = String(numTotal)

        }
        else if(sender.tag == 12) //if clicked percentage %
        {

            numTotal = numTotal / 100.00
            lblTotal.text = String(numTotal)

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

