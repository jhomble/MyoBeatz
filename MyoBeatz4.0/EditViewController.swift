//
//  EditViewController.swift
//  MyoBeatz4.0
//
//  Created by Julien Homble on 1/30/16.
//  Copyright © 2016 Julien Homble. All rights reserved.
//

import Cocoa
import AVFoundation

class EditViewController: NSViewController {

    @IBOutlet weak var btnHand: NSButton!
    @IBOutlet weak var cbgest1: NSComboBox!
    @IBOutlet weak var cbgest2: NSComboBox!
    @IBOutlet weak var cbgest3: NSComboBox!
    @IBOutlet weak var cbgest4: NSComboBox!
    
    @IBOutlet weak var btngest1: NSButton!
    @IBOutlet weak var btngest2: NSButton!
    @IBOutlet weak var btngest3: NSButton!
    @IBOutlet weak var btngest4: NSButton!
   
    
    
    //let data = dataHashMap.sharedInstance;
    //var soundArr:[String] = data.getSoundNames();
    var soundArr:[String] = dataHashMap.sharedInstance.getSoundNames();
    var soundPlayer:AVAudioPlayer = AVAudioPlayer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        cbgest1.addItemsWithObjectValues(soundArr);
        cbgest2.addItemsWithObjectValues(soundArr);
        cbgest3.addItemsWithObjectValues(soundArr);
        cbgest4.addItemsWithObjectValues(soundArr);
        
    }
    
    
    
    @IBAction func btnHandOnClick(sender: AnyObject) {
        if(btnHand.title == "Left Hand"){
            btnHand.title = "Right Hand"
        }
        else{
            btnHand.title = "Left Hand"
        }
    }
    
    @IBAction func playgest1(sender: AnyObject) {
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath((cbgest1.selectedCell()?.title)!), withExtension: "aif")!;
        playGest(gestSound);
    }
    
    @IBAction func playgest2(sender: AnyObject) {
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath((cbgest2.selectedCell()?.title)!), withExtension: "aif")!;
        playGest(gestSound);
    }
  
    
    @IBAction func playgest3(sender: AnyObject) {
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath((cbgest3.selectedCell()?.title)!), withExtension: "aif")!;
        playGest(gestSound);
    }
    
    @IBAction func playgest4(sender: AnyObject) {
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataHashMap.sharedInstance.getPath((cbgest4.selectedCell()?.title)!), withExtension: "aif")!;
        playGest(gestSound);
    }
    
    func playGest(url: NSURL){
        do { soundPlayer = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil) } catch _ { }
        soundPlayer.prepareToPlay()
        soundPlayer.play()
    }
    
  
}
