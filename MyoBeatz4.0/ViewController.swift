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
    @IBOutlet weak var lbgest1: NSTextField!
    @IBOutlet weak var lbgest2: NSTextField!
    @IBOutlet weak var lbgest3: NSTextField!
    @IBOutlet weak var lbgest4: NSTextField!
    @IBOutlet weak var btnplaygest1: NSButton!
    @IBOutlet weak var btnplaygest2: NSButton!
    @IBOutlet weak var btnplaygest3: NSButton!
    @IBOutlet weak var btnplaygest4: NSButton!
    
    var timer:NSTimer = NSTimer();
    var counter = 0;
    var myAudioPlayer:AVAudioPlayer = AVAudioPlayer()
    var audioRecorder: AVAudioRecorder = AVAudioRecorder()
    var sounds:[String] = []
    
    
    static let sharedInstance = ViewController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        
        lbTimer.stringValue = String(counter)
        
        NSEvent.addLocalMonitorForEventsMatchingMask(.KeyDownMask) {
            (aEvent) -> NSEvent? in
            self.keyDown(aEvent)
            return aEvent
        }
        
        changeGest1()
        changeGest2()
        changeGest3()
        changeGest4()
        
        /*sounds = dataHashMap.sharedInstance.getSoundNames();
        lbgest1.stringValue = sounds[0];
        print(lbgest1.stringValue);
        lbgest2.stringValue = sounds[1];
        print(lbgest2.stringValue);
        lbgest3.stringValue = sounds[2];
        print(lbgest3.stringValue);
        lbgest4.stringValue = sounds[3];
        print(lbgest4.stringValue);
        */
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
    
    @IBAction func updateSounds(sender: AnyObject) {
        changeGest1()
        changeGest2()
        changeGest3()
        changeGest4()
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
    
    func changeGest1(){
        lbgest1.stringValue = dataHashMap.sharedInstance.getCurrentSounds()[0];
    }
    
    func changeGest2(){
        lbgest2.stringValue = dataHashMap.sharedInstance.getCurrentSounds()[1];
    }
    
    func changeGest3(){
        lbgest3.stringValue = dataHashMap.sharedInstance.getCurrentSounds()[2];
    }
    
    func changeGest4(){
        lbgest4.stringValue = dataHashMap.sharedInstance.getCurrentSounds()[3];
    }
    
    func UpdateTimer() {
        lbTimer.stringValue = String(counter++)
    }

    override func keyDown(theEvent: NSEvent) {
        //print("key event!!")
        if (theEvent.keyCode == 1){
            //print("key press detected playing sound 1");
           // let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath((cbgest1.selectedCell()?.title)!), withExtension: "aif")!;

            //do whatever when the s key is pressed
        }
    }
    
    func playGest(url: NSURL){
        do { myAudioPlayer = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil) } catch _ { }
        myAudioPlayer.prepareToPlay()
        myAudioPlayer.play()
    }
    
    @IBAction func playgest1(sender: AnyObject) {
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath(lbgest1.stringValue), withExtension: "aif")!;
        playGest(gestSound);
    }

    @IBAction func playgest2(sender: AnyObject) {
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath(lbgest2.stringValue), withExtension: "aif")!;
        playGest(gestSound);
    }
    
    @IBAction func playgest3(sender: AnyObject) {
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath(lbgest3.stringValue), withExtension: "aif")!;
        playGest(gestSound);
    }
    
    @IBAction func playgeset4(sender: AnyObject) {
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath(lbgest4.stringValue), withExtension: "aif")!;
        playGest(gestSound);
    }
    
    func record() {
        
        
    }

}

