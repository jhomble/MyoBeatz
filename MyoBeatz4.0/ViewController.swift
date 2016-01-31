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
    @IBOutlet weak var chkloop: NSButton!
    @IBOutlet weak var chkrecord: NSButton!
    @IBOutlet weak var lbTimer: NSTextFieldCell!
    
    var timer:NSTimer = NSTimer();
    var counter = 0;
    var myAudioPlayer:AVAudioPlayer = AVAudioPlayer()
    var audioRecorder: AVAudioRecorder = AVAudioRecorder()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        
        lbTimer.stringValue = String(counter)
        
        NSEvent.addLocalMonitorForEventsMatchingMask(.KeyDownMask) {
            (aEvent) -> NSEvent? in
            self.keyDown(aEvent)
            return aEvent
        }
        
        
        NSEvent.addLocalMonitorForEventsMatchingMask(.FlagsChangedMask) { (theEvent) -> NSEvent? in
            self.flagsChanged(theEvent)
            return theEvent
        }
    }
    
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColorRef = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0)
            self.view.layer?.backgroundColor = color
        }
        
    }
    
    

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func btnRecordClick(sender: AnyObject) {
        /*let url:NSURL = NSBundle.mainBundle().URLForResource("bass_fart", withExtension: ".aif")!
        do {
            myAudioPlayer = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil) } catch _ { }
            myAudioPlayer.prepareToPlay()
            myAudioPlayer.play()
        */
        if (chkrecord.state == 0){
            chkrecord.state = 1;
            chkrecord.title = "Recording..."
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("UpdateTimer"), userInfo: nil, repeats: true)
            
        } else{
            counter = 0
            chkrecord.state = 0;
            chkrecord.title = "Off"
            timer.invalidate()
            
            
        }
        
    }
    
    func UpdateTimer() {
        lbTimer.stringValue = String(counter++)
    }

    override func keyDown(theEvent: NSEvent) {
        //print("key event!!")
        if (theEvent.keyCode == 1){
            print("assda");
            //do whatever when the s key is pressed
        }

    }
    
    func record() {
        
        
    }

}

