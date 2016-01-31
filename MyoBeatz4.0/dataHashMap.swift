//
//  dataHashMap.swift
//  MyoBeatz4.0
//
//  Created by Julien Homble on 1/30/16.
//  Copyright © 2016 Julien Homble. All rights reserved.
//

import Cocoa

class dataHashMap{
    
    var h : Dictionary<String,String>;
    var currSounds: [String];
    static let sharedInstance = dataHashMap();
    
    /*class var sharedInstance : dataHashMap{
        struct Static{
            static let instance : dataHashMap = dataHashMap()
        }
        return Static.instance;
    }*/
    
    private init(){
        h = Dictionary<String,String>();
        h["Bass Fart"] = "bass_fart";
        h["Curious Bass"] = "curiousbass";
        h["ohh"] = "ohh";
        h["Vocal Hit"] = "vocalhit";
        h["Buzzsaw Bass"] = "buzzsaw-bass-synth";
        
        currSounds = ["Bass Fart", "Curious Bass", "ohh", "Vocal Hit"]
    }
    
    func getSoundNames() -> [String]{
        var soundArr: [String] = [];
        for name in h.keys{
            soundArr.append(name);
        }
        return soundArr;
    }
    
    func getPath(name:String) -> String{
        return h[name]!;
    }
    
    func changeCurrentSounds(name:String, index:Int){
        self.currSounds[index] = name;
    }
    
    func getCurrentSounds() -> [String]{
        return self.currSounds;
    }
}
