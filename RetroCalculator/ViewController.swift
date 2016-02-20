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
    //Properties
    var btnSound: AVAudioPlayer!
    //Outlets
    @IBOutlet weak var outputLbl: UILabel!
    //Actions
    @IBAction func numberPressed(btn: UIButton)
    {
        btnSound.play()
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

