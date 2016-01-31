//
//  YourSoundsViewController.swift
//  MyoBeatz4.0
//
//  Created by Julien Homble on 1/30/16.
//  Copyright © 2016 Julien Homble. All rights reserved.
//

import Cocoa
import AVFoundation

class YourSoundsViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var tblMusic: NSTableView!

    var soundPlayer:AVAudioPlayer = AVAudioPlayer();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true

        tblMusic.reloadData();
        // Do view setup here.
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColorRef = CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0)
            self.view.layer?.backgroundColor = color
        }
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return dataMusicHash.sharedInstance.getCount();
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cellView = tblMusic.makeViewWithIdentifier("cell", owner: self) as! NSTableCellView;
        cellView.textField?.stringValue = dataMusicHash.sharedInstance.getMusicNames().objectAtIndex(row) as! String;
        print(cellView.textField?.stringValue)
        return cellView;
    }
    
    
    @IBAction func tblOnclick(sender: AnyObject) {
        print(tableView(tblMusic, viewForTableColumn: nil, row: 1));
        let gestSound:NSURL = NSBundle.mainBundle().URLForResource(dataMusicHash.sharedInstance.getPath(tblMusic.stringValue), withExtension: "aif")!;
        playGest(gestSound);
    }
    
    func playGest(url: NSURL){
        do { soundPlayer = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil) } catch _ { }
        soundPlayer.prepareToPlay()
        soundPlayer.play()
    }
}
