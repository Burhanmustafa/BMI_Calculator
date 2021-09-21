//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Burhan Mustafa on 2021-09-08.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct calculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiDecPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiDecPlace
        
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.black
        
    }

    
mutating func calculateBMI(height: Float, weight: Float) {
    let bmiValue = weight / (height * height)
    
    if bmiValue < 18.5 {
        bmi = BMI(value: bmiValue, advice: "Eat more fries!", color: UIColor.blue)
    } else if bmiValue < 24.9 {
        bmi = BMI(value: bmiValue, advice: "You are all good!", color: UIColor.green)
        
    } else {
        bmi = BMI(value: bmiValue, advice: "Eat less fries!", color: UIColor.red)
    }
    
}
}
