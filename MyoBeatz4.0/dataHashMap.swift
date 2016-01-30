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
}
