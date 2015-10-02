//
//  ViewController.swift
//  dylanwatts_hw1
//
//  Created by ddwatts on 9/12/15.
//  Copyright (c) 2015 ddwatts. All rights reserved.
//  Dylan Watts, MW 12:00
//
//  View for expenditure calculator app.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //Text fields on top half of screen
    @IBOutlet weak var food: UITextField!
    @IBOutlet weak var transport: UITextField!
    @IBOutlet weak var household: UITextField!
    @IBOutlet weak var other: UITextField!
    
    //Text fields on bottom half of screen
    @IBOutlet weak var foodTotal: UITextField!
    @IBOutlet weak var transportTotal: UITextField!
    @IBOutlet weak var householdTotal: UITextField!
    @IBOutlet weak var otherTotal: UITextField!
    
    //Percentage labels
    @IBOutlet weak var foodPecent: UILabel!
    @IBOutlet weak var transportPercent: UILabel!
    @IBOutlet weak var householdPercent: UILabel!
    @IBOutlet weak var otherPercent: UILabel!
    
    //Expenditure calculator model
    var expCalc: expModel = expModel();
    
    override func viewDidLoad() {

        //Text field delegates so keyboard hiding works
        food.delegate = self;
        transport.delegate = self;
        household.delegate = self;
        other.delegate = self;
        foodTotal.delegate = self;
        transportTotal.delegate = self;
        householdTotal.delegate = self;
        otherTotal.delegate = self;
        
        //closes keyboard if you tap outside of it, easier method
        var outOfKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:"closeKeyboard");
        view.addGestureRecognizer(outOfKeyboard);
        
    }
    
    @IBAction func addButton(sender: AnyObject) {
        
        //convert text field input to doubles  //TAKE OUT SELF. ?
        var foodAmt = (self.food.text as NSString).doubleValue
        var transportAmt = (self.transport.text as NSString).doubleValue
        var householdAmt = (self.household.text as NSString).doubleValue
        var otherAmt = (self.other.text as NSString).doubleValue
        
        //model add function
        expCalc.add(foodAmt, transportAmt: transportAmt, householdAmt: householdAmt, otherAmt: otherAmt)
        
        //display values from model at totals area in view
        var foodTotalAmt = NSString(format: "%.2f", expCalc.totalFood);
        self.foodTotal.text = foodTotalAmt as String;
        
        var transTotalAmt = NSString(format: "%.2f", expCalc.totalTransport);
        self.transportTotal.text = transTotalAmt as String;
        
        var householdTotalAmt = NSString(format: "%.2f", expCalc.totalHousehold);
        self.householdTotal.text = householdTotalAmt as String;
        
        var otherTotalAmt = NSString(format: "%.2f", expCalc.totalOther);
        self.otherTotal.text = otherTotalAmt as String;
        
        //use model to get percentages and display them
        self.foodPecent.text = expCalc.getPercent(expCalc.totalFood);
        self.transportPercent.text = expCalc.getPercent(expCalc.totalTransport);
        self.householdPercent.text = expCalc.getPercent(expCalc.totalHousehold);
        self.otherPercent.text = expCalc.getPercent(expCalc.totalOther);
        
    }
    
    //clears top text fields
    @IBAction func clearButton(sender: AnyObject) {
        
        self.food.text = "";
        self.transport.text = "";
        self.household.text = "";
        self.other.text = "";

    }
    
    //clears everything
    @IBAction func clearAllButton(sender: AnyObject) {
        
        expCalc.clearAll();
        
        self.food.text = "";
        self.transport.text = "";
        self.household.text = "";
        self.other.text = "";
        self.foodTotal.text = "";
        self.transportTotal.text = "";
        self.householdTotal.text = "";
        self.otherTotal.text = "";
        
        self.foodPecent.text = "";
        self.transportPercent.text = "";
        self.householdPercent.text = "";
        self.otherPercent.text = "";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeKeyboard(){
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    


}

