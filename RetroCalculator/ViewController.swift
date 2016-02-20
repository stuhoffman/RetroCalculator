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
    
    //Outlets
    @IBOutlet weak var outputLbl: UILabel!
    //Actions
    @IBAction func numberPressed(btn: UIButton)
    {
        playButtonSound()
        runningNumber += "\(btn.tag)"
        print("New number Pressed = ",btn.tag)
        updateOutputLabel()
    }
    
    
    @IBAction func onDividePressed(sender: AnyObject) {
        playButtonSound()
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        playButtonSound()
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        playButtonSound()
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        playButtonSound()
    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        playButtonSound()
    }
    
    func playButtonSound()
    {
        btnSound.play()
    }
    
    func updateOutputLabel()
    {
        outputLbl.text = "\(runningNumber)"
        print("Running Number = \(runningNumber)")
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

