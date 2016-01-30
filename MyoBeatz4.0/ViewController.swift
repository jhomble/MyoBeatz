//
//  ViewController.swift
//  MyoBeatz4.0
//
//  Created by Julien Homble on 1/30/16.
//  Copyright © 2016 Julien Homble. All rights reserved.
//

import Cocoa
import AVFoundation
import AppKit


class ViewController: NSViewController {
    
    @IBOutlet weak var btnloop: NSButton!
    @IBOutlet weak var btnrecord: NSButton!
    
    var myAudioPlayer:AVAudioPlayer = AVAudioPlayer()
    var audioRecorder: AVAudioRecorder = AVAudioRecorder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func btnRecordClick(sender: AnyObject) {
        let url:NSURL = NSBundle.mainBundle().URLForResource("bass_fart", withExtension: ".aif")!
        do {
            myAudioPlayer = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil) } catch _ { }
            myAudioPlayer.prepareToPlay()
            myAudioPlayer.play()
        
    }

}

