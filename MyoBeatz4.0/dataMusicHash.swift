//
//  dataMusicHash.swift
//  MyoBeatz4.0
//
//  Created by Julien Homble on 1/30/16.
//  Copyright © 2016 Julien Homble. All rights reserved.
//

import Cocoa

class dataMusicHash {
    
    var h : Dictionary<String,String>;
    static let sharedInstance = dataMusicHash();
    
    private init(){
        h = Dictionary<String,String>();
        h["Bass Fart"] = "bass_fart";
        h["Curious Bass"] = "curiousbass";
        h["ohh"] = "ohh";
        h["Vocal Hit"] = "vocalhit";
        h["Buzzsaw Bass"] = "buzzsaw-bass-synth";
    }
    
    func getMusicNames() -> NSMutableArray{
        var soundArr: NSMutableArray = [];
        for name in h.keys{
            soundArr.addObject(name);
        }
        return soundArr;
    }
    
    func getPath(name:String) -> String{
        if(name != ""){
            print("a");
            print(name);
            print("b");
            return h[name]!;
        }
        else { return ""; }
    }

    func getCount() -> Int{
        return h.count;
    }

}
