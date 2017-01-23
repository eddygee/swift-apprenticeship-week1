//
//  MainViewController.swift
//  Week1
//
//  Created by Eddy Gee on 1/22/17.
//  Copyright © 2017 Vivid Arts. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var startingDigit = 0
    var _total = 0
    var numberStack = [Int]()
    var operationStack = [String]()
    
    @IBOutlet weak var mainLbl: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        mainLbl.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func updateMainLbl(_ sender: UIButton) {
        
        if let button = sender as? UIButton {
            
            var output = ""
            
            if button.titleLabel?.text == "AC" {
                clear(all: true)
            }
            else if
                button.titleLabel?.text == "*"
                || button.titleLabel?.text == "+"
                || button.titleLabel?.text == "-"
                || button.titleLabel?.text == "/" {
                
                guard isDigit(mainLbl.text!) else{ return }
                
                addToNumbersStack(digit: mainLbl.text!, operation: (button.titleLabel?.text)!)
                total(operation: (button.titleLabel?.text)!)
                
                
            }else if button.titleLabel?.text == "=" {
                
                addToNumbersStack(digit: mainLbl.text!, operation: nil)
                total(operation: operationStack[0])
                
            }else{
                
                if mainLbl.text != "" {
                    output = mainLbl.text!
                }
                output = output + (button.titleLabel?.text)!
                mainLbl.text = output
            }
        }
    }
    
    func isDigit(_ str:String) -> Bool
    {
        guard let digit = mainLbl.text,
            digit != "",
            Int(digit) != nil else {
                return false
        }
        
        return true
    }
    
    
    func clear() {
        mainLbl.text = ""
        
    }
    
    func clear(all:Bool) {
        mainLbl.text = ""
        
        reset()
    }
    
    func reset() {
        
        numberStack = []
        operationStack = []
        _total = 0
    }
    
    func total(operation:String) {
        
        if numberStack.count == 1 {
            clear()
            return
        }
        
        switch operation {
        case "*":
            mainLbl.text = "\(numberStack[0] * numberStack[1])"
        case "/":
            mainLbl.text = "\(numberStack[0] / numberStack[1])"
        case "+":
            mainLbl.text = "\(numberStack[0] + numberStack[1])"
        case "-":
            mainLbl.text = "\(numberStack[0] - numberStack[1])"
        case "=":
            total(operation:operationStack[0])
        default:
            return
        }
        
//        reset()
    }
    
    func addToNumbersStack(digit:String, operation:String?) {
        guard digit != "",
            Int(digit) != nil else {
                return
        }
        
        numberStack.append(Int(digit)!)
        if(operation != nil) { operationStack.append(operation!) }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
