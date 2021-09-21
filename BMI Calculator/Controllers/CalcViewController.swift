//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    var calcBrain = calculatorBrain()
    

    @IBOutlet weak var heightSlide: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlide: UISlider!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let output = String(format: "%.2f", sender.value)
        heightLabel.text = output + "m"
    }
    @IBAction func weightSlideChanged(_ sender: UISlider) {
        let output = Int(sender.value)
        weightLabel.text = String(output) + "Kg"
    }
    
    @IBAction func calcPressed(_ sender: UIButton) {
        let height = heightSlide.value
        let weight = weightSlide.value
        
        calcBrain.calculateBMI(height: height, weight: weight)
        
        
        //showing second viewcontroller
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // checking if the viewcontroller that is being transitioned to is the correct one.
        if segue.identifier == "goToResult" {
            // creating reference to new viewctonroller that is initiailzied when segue is performed
            // using as! to make sure that the destinationVC is a resultviewcontroller and not just a UIviewcontroller
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue =  calcBrain.getBMIValue()
            
            destinationVC.advice = calcBrain.getAdvice()
            destinationVC.color = calcBrain.getColor()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(heightSlide.value)
    }


}

