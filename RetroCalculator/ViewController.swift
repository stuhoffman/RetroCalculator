//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Stuart Hoffman on 2/19/16.
//  Copyright © 2016 Stuart Hoffman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    //Properties
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    //Outlets
    @IBOutlet weak var outputLbl: UILabel!
    //Actions
    @IBAction func numberPressed(btn: UIButton)
    {
        playButtonSound()
        runningNumber += "\(btn.tag)"
        print("New number Pressed = ",btn.tag)
        updateOutputLabel(runningNumber)
    }
    
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation)
    {
        playButtonSound()
        if currentOperation != Operation.Empty
        {
            //do some math
            if runningNumber != ""
            {
                print("Continuing operation \(op) runningNumber=\(runningNumber)")
                rightValStr = runningNumber
                runningNumber = ""
                
                //User selected  a second operator without entering a number
                if currentOperation == Operation.Multiply
                {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide
                {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Add
                {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract
                {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }
                leftValStr = result
                updateOutputLabel(result)

            }
            currentOperation = op
        } else
        {
            print("First use of operation  \(op) storing \(runningNumber) on left")
            //first time so just display a result
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
        
    }
    func playButtonSound()
    {
        //to stop clipping
        if btnSound.playing
        {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    func updateOutputLabel(val: String)
    {
        outputLbl.text = "\(val)"
        print("Running Number = \(val)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //init the sound file
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

