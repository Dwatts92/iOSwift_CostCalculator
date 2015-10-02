//
//  expenditureModel.swift
//  dylanwatts_hw1
//
//  Created by ddwatts on 9/12/15.
//  Copyright (c) 2015 ddwatts. All rights reserved.
//  Dylan Watts, MW 12:00
//
//  Expenditure calcuator model. Method descriptions are documented in-line below


import Foundation

class expModel
{
    //set inital values to 0
    var total = 0.00
    var totalFood = 0.00
    var totalTransport = 0.00
    var totalHousehold = 0.00
    var totalOther = 0.00
    
    //Add() sums together each value for the expenditures, including the total of everything
    func add(foodAmt: Double, transportAmt: Double, householdAmt:Double, otherAmt:Double)
    {
        totalFood += foodAmt
        totalTransport += transportAmt
        totalHousehold += householdAmt
        totalOther += otherAmt
        
        total += foodAmt + transportAmt + householdAmt + otherAmt;
    
    }
    
    //ClearAll() sets everything back to 0.
    func clearAll()
    {
        total = 0.00
        totalFood = 0.00
        totalTransport = 0.00
        totalHousehold = 0.00
        totalOther = 0.00
    }
    
    //getPercent() calculates percentage of value and returns value as string
    func getPercent(amount: Double) -> String{
        
        var percentage = ((amount/total) * 100);
        var percentageAmt = NSString(format: "%.2f", percentage);
        return (percentageAmt as String);
        
    }
}
