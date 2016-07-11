//
//  MetronomController.swift
//  GuitarHelper
//
//  Created by Ivan Pryadchenko on 11.07.16.
//  Copyright © 2016 Ivan Pryadchenko. All rights reserved.
//

import WatchKit



class MetronomController: WKInterfaceController {

    @IBOutlet var pickerSpeed: WKInterfacePicker!
    @IBOutlet var buttonStart: WKInterfaceButton!
    
    
    
    var indexPicker = 0
    
    var beat = NSTimer()
    
    
    var flagStart = true
    
    var player: WKAudioFilePlayer!
    var items: [String]! = nil
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
//        let path = NSBundle.mainBundle().pathForResource("beep", ofType:"m4a")
//        let fileURL = NSURL(fileURLWithPath: path!)
//        player = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
//        player.prepareToPlay()
//        player.delegate = self

        
        var pickerItems: [WKPickerItem] = []
        for i in 40...208 {
            let item = WKPickerItem()
            item.title = "\(i)"
            pickerItems.append(item)
        }
        
        
        self.pickerSpeed.setSelectedItemIndex(80)
        self.pickerSpeed.setItems(pickerItems)
        
        // Configure interface objects here.
    }
    
    @IBAction func pickerIndex(value: Int) {
        print(value)
        if value > 0 {
            indexPicker = value + 40
        }
        else {
            indexPicker =
            40
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    
    @IBAction func buttonStartPush() {
        if flagStart {
        print(indexPicker)
        let beatPylse = 60.0/Double(indexPicker)
        beat.invalidate()
        beat = NSTimer.scheduledTimerWithTimeInterval(beatPylse, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        flagStart = false
        }
        else {
            print("AHOY")
            beat.invalidate()
            flagStart = true
            
        }
    }
    
    func timerAction() {
        print("HI")
//        player.play()
        WKInterfaceDevice.currentDevice().playHaptic(.Click)
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
